<template>
	<view class="time-picker">
		<view class="time-inner" :class="{ right: align === 'right' }" @click="handleShow">
			<template v-if="value">
				<view class="time-text">{{ value }}</view>
			</template>
			<template v-else>
				<view class="time-placeholder">{{ placeholder }}</view>
			</template>
			<u-icon class="icon" :class="{ rotate: show === true }" size="14" name="arrow-down" color="#C4C4C4"></u-icon>
		</view>

		<u-datetime-picker
			v-model="value"
			:show="show"
			format="HH:mm"
			mode="time"
			:formatter="formatter"
			confirm-color="#017dff"
			cancel-color="#9a9a9a"
			close-on-click-overlay
			v-bind="attrs"
			@confirm="handleConfirm"
			@cancel="show = false"
			@close="show = false"
		></u-datetime-picker>
	</view>
</template>

<script lang="ts">
	export default {
		options: {
			virtualHost: true,
			styleIsolation: 'shared'
		}
	};
</script>
<!-- <script lang="ts" setup>

const slots = useSlots();
const attrs = useAttrs();

const props = defineProps({
modelValue: PropTypes.oneOfType([PropTypes.number,PropTypes.string]).def(''),
placeholder: PropTypes.string.def('请选择开启时间'),
align: PropTypes.oneOf(['left','right']).def('left')
});
const emit = defineEmits(['update:modelValue','comfirm']);
const value = computed({
get: () => {
  return props.modelValue;
},
set: value => {
  emit('update:modelValue', value);
}
});


const formatter = (type, value) => {
if (type === 'hour') {
  return `${value}时`;
}
if (type === 'minute') {
  return `${value}分`;
}
return value;
};


const show = ref(false);
function handleShow(){
show.value = true
}

function handleConfirm(e){
show.value = false
nextTick(() => {
  emit('comfirm')
})
}

</script> -->

<style scoped lang="less">
	.time-picker {
		.time-inner {
			min-width: 200rpx;
			height: 24px;
			display: flex;
			align-items: center;
			.time-text {
				flex: 1;
				font-weight: bold;
				font-size: 28rpx;
				color: #313131;
			}
			.time-placeholder {
				flex: 1;
				font-size: 28rpx;
				color: #9a9a9a;
			}
			&.right {
				display: flex;
				justify-content: flex-end;
				.time-text {
					text-align: right;
				}
				.time-placeholder {
					text-align: right;
				}
			}

			.icon {
				margin-left: 20rpx;
				transition: all linear 0.1s;
				&.rotate {
					transform: rotate(180deg);
				}
			}
		}
	}
</style>
