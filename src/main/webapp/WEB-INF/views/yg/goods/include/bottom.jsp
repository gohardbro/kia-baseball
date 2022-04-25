<%@ page contentType="text/html; charset=UTF-8"%>

<style>
.goodsInfo {
	width: 50%;
	font-size:1em;
	line-height:3;
}

a {
	border-bottom: inherit;
	color: black;
}

a:hover {
	color: navy;
}

.paging ul li {
	list-style: none;
	float: left;
	padding-left: 1.5em;
	padding-top: 7px;
}

.paging ul {
	text-align: center;
}

.paging ul li a {
	font-size: 20px;
}

h2 {
	text-align: center;
	font-weight: 600;
}

.nav-link {
	color: navy;
}

.nav-link.active {
	background-color: navy;
}

.wrapper.style1 {
	padding-top: 40px;
}

h5 {
	font-weight: 600;
}

.goods-list ._align {
	height: 28px;
	margin: 12px 0 20px;
	/* 	padding: 9px 0 10px; */
	border-top: 1px solid #717171;
	/* 	border-bottom: 1px solid #dadada; */
	clear: both;
}

.goods-list ._align ul {
	float: left;
}

.goods-list ._align ul li {
	position: relative;
	float: left;
	height: 23px;
	margin: 0 20px 0 0;
	padding: 5px 0 0;
	background: #fff;
}

ul, ol, li {
	list-style: none;
}

ul {
	display: block;
	/*     list-style-type: disc; */
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

input.radio {
	width: 13px;
	height: 13px;
	vertical-align: top;
}

input[type="radio" i] {
	background-color: initial;
	cursor: default;
	appearance: auto;
	box-sizing: border-box;
	/*     margin: 3px 3px 0px 5px; */
	/*     padding: initial; */
	border: initial;
}

.goods-view .goods .image .thumbnail {
	display: table-cell;
	width: 398px;
	height: 398px;
	border: 1px solid #d1d1d1;
	text-align: center;
	vertical-align: middle;
}

.goods-thumbnail {
	position: relative;
	float: left;
	width: 35%;
}

.goods-info {
	float: right;
	width: 65%;
	position: relative;
}
</style>
