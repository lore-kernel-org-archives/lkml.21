Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478603;
	b=nwttFT0wo3rjtLCQ67seWpUcUyrwTftl7LtjJyOhLSEeeloOCvAXMTe79xS4BPiIztED
	 CjYBTjMgcqkFVmdM6+5dNjvOLZOk9hpcJDSfMrAxS4qXlDJLS5oPG1ydgg05lSs7snmZX
	 vK9IxvuDwLc/D5mtyrto4NZFdfpBqhknHjiR5cKNWKRmXOSbrByDznNBCK8M4OyA5hyTj
	 pKGJRDGftkWJ4OFk+rIjVwrTt0/VoxWPJqLF3FzbveXSOdW4YJjqJZeLs7/zskO//qBp0
	 DTrhlBHLgnfzjzCMrgBgPXn3k5QTQRTNHNz2Lely9a0ZmlLSiLZ5DNbXhtrXqc+WJyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478603;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=PAtsEURMjw6BMx3O8gA1fyA7I7ZNfExjOJqh5VnpOJg=;
	b=rQsHoTAachNmtZPdm+N9lVYoe9HPcuKV5lrm1lIgRWmrtrHwl4mPQR0C5IAEXvm6+g3u
	 0XoWu8Wkj3p6gwVjAK6lLKUH1DRzimdbFJKybytyEdob7j0yXE9C17BygubsOYwGfCHtr
	 Qd9YS3e/9ANtOK77ArsnKkbovDvWKljSoGRWaS4LYLIofHk40kxhSPIKTMgCFxrv5J02t
	 QN5e4zsFq7U9Kw4a/Ixfcl5kWtJFC9xQH5WQQuS98Lez/GO3Cm0Tuik00qr0wNqb1/nXG
	 KC+ev3fZ7iJXtD/dv9crAIJ1jYLENtkxJzbkej7ZRpmsuNuz+i9H1etx9jqBVqEz2Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=LqPFM7mM;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MeLfp4qW;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B18606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 00:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56B18606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm2 header.b=LqPFM7mM;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MeLfp4qW
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 91726140039F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:03:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 23 Nov 2026 19:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1795478601; x=
	1795565001; bh=PAtsEURMjw6BMx3O8gA1fyA7I7ZNfExjOJqh5VnpOJg=; b=L
	qPFM7mMPil54tq78/Jd716sHwg7RwguLNAEGWU7uMM3cP+oa852l00DPW512c992
	l3KLI5hWIA2keF9wrnHOH44SfbQ/DF+IsiaPgtd9wVJk56SLUPJ+ewHvG+OPTTfN
	cgdKC91hfDy0OYCKlNhkclYnNzbYrHvjoRitALYt2WNGRduADer35oWsySCWts2+
	PxnBy9sNYUhaq8P7+sYq5Brzb5CVB78P+5mb3cVlRzuwhPErrYSmCkdVz4t25Mkz
	/4lQUMm8GizkCmcDwy35uI9iCpc05f4wYtIuERYHx+/Rmp8rMhPtYmLsyMwE9ThU
	LAkMYEtGgc4LHxzE8/dXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1795478601; x=1795565001; bh=P
	AtsEURMjw6BMx3O8gA1fyA7I7ZNfExjOJqh5VnpOJg=; b=MeLfp4qWPzPIBJLHc
	fvrGICUQsgTwFQvsKP4tFcZKQLqwTEUCUxA3iNHs8GihxZ27B2jZPBYJEx0uci8T
	C8TsEic6fwdRVx+eUEVWLgtRPvAYUV4Cbl4YpczwItKcIwTrxwhNjnKX9nqs6RKT
	gtWj8uavBJcv++XU+br9iKu8iFvGfZZIzW6ymjP/UOXN5u73WSmdxHExiOjNXVXl
	AJjcQxq90VZn0a3xhIB8a3I/EGxlNMpAvkNBDMvzf13eF3nJ70btcAnv6dHvEc4Y
	aT7dXN/jXtg0LCKUT07iJ9Q/bDEX5IXxD78ZDclrDWqMOTGJQZu3KXAoAkgGY95H
	1Ricw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795478601; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:ATsEia9/0Ks0pyamsLjpcOuEFI5gy8JoMLQXFeBpnZFwNVY
	x0H1wt1u7G9kL6RmVd9OtFGBSqV2TT2bIukmDtbIgrqRCQY0+7jEFxLFS9a+4edm
	7hW2jfKk5YrJ6qJlyx7OWAcDT3aQy+bWjm5bIzcdv6NMqwb/v65gBGjRisDvg2XB
	z02617gcD6rMaRmKyoopBmvIvFV31b+yuwvG1KSp7IaTUXYJ9n3ch6kiXLNGSuR+
	vPc/F3akYxoqBgiDPU7KiFkbfZLH+8BVgGSLfDLIeF4nPJYCDD1fJiwPCUIQD93Y
	DTLSkh9oWBTRnxusHfz7E36icigekFBGUFcBQ/w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:C1BWLQcnSytZepq4fTMqH2u1iaoudV1OrEuQTXPxCxI=:75ct8d2NEqNy8dcL0uqvryMqIsqJanWM8NlkNmCp4FM=;
X-ME-Sender: <xms:SdQEa-sIeKyLAuqXySBonp3mPo5W-yYxD9H2Yap2i-QpPv0ygCY62w>
    <xme:SdQEa0tvnOUEJ-OcoUYOXRapDxUTmlv44FJnLcWcc21weubyfhGm3G1ZYmVWZXqR5
    D6xUtRTVCwAEdfQBz9jDtk53-AHBD0cl465bKSZz_ybLnHWiw_5VFXQ>
X-ME-Received: <xmr:SdQEa_F_XEC4OTo-W7frqgaExL9vSfuVFgcnc8h-bdzbk8L774n-e5HISmI6u_EnFURzrrHl>
X-ME-Proxy-Cause: dmFkZTEIvCBAqgUEloIsFZ3FkPJniX+pdPbA8lwmlIZBO9hGOTGGz/x2Hl+7nFbV5nyvKp
    t925nNRn8DutQCQinVZPr73dXFznYxFvXbL116jqCZ/GfyonUZh/Db8T2FiyXrfT2tvgmY
    iobzatdB+GcoyC0jM5VyW//zQbbnDI1hKnSbxsDcxkUlD4xzycqbxXM6vvDpB+AvPZI9PO
    U/XSWb9pjObA40eWatkEvdJBkQEqjCEU+A4urP116L3cv2N0DBt76GIBJcBDbwZQhbIQjC
    SOwjlJv+Q9QIaSqFf9Kz25pG8hZtrsSllc9yq5WXEJr9X0qGFNbX1Y7L6XZjelykM9Ldlj
    QmYfQnu0oE0th0KiUcGx0BpMkjJLthd3bKUwFDw4YTV0EKGlUjFGl7tgyMnt+y+zTjDfMn
    A5hn9D1CuCrMq63UC4P99nXpZOxG970N7X220xsTvy0qEZVNUEzFBwLxXq6z/ptaQdLiK/
    5ajJg4DLERCe4jjGrZU50SAnnJv15ESTpkwVwTBKOZ57IUR2lClbNgO4PB97kdYHOcVIYI
    vf0Oy+mmADrxqqMTl7osFUtXo4LyLrTomfvYSe6UEARwkvgzImWLUKXmg3FhO4wovXTLNi
    Yd0svLJbtcBfeaZEUYGDbhnTPHzxtURDZto106cvXxQCV5eSz03oHModg6qQ
X-ME-Proxy: <xmx:SdQEa3KRuUEyLxuR93E9SV1LN2Afhyae9W7rL4bR-1BH50iDrkH9Lw>
    <xmx:SdQEa_Yl73dEbwPGkPLddSp9eFvYSOAtvmkfy5OMPGiv9SfFxLgQlQ>
    <xmx:SdQEa8rlnUnM0ayQtCzAukRelyoXbPY_-L2Sv3wPuyz9phY9w_Pygw>
    <xmx:SdQEa_HTdRppX0ht58zEsMip-7Po_arXDr5VrqTkylbdCl8rl3Q3dw>
    <xmx:SdQEa3ojmRkqc_OHowVk7JwlBn0DV7gOfg64nfTP7pvvp2y0vgl7jhSb>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Nov 2026 19:03:13 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: ddrake@baylibre.com,
	royalnet026@gmail.com,
	sidong.yang@furiosa.ai,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v18 8/8] arm64: dts: rockchip: enable the NPU on rk3576-rock-4d
Date: Tue, 24 Nov 2026 13:01:43 +1300
Message-ID: <0bcd73278a4c7a0cb2e1b8bdb9aba306355384cb.1795478392.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795478392.git.gahing@gahingwoo.com>
References: <cover.1795478392.git.gahing@gahingwoo.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable both NPU cores and their IOMMUs, and make vdd_npu_s0 the supply
of the NPU power domain. The rail is switched with the domain by commit
b1bff9ced657 ("pmdomain: rockchip: manage the RK3576 NPU domain supply")
in the pmdomain tree; without it nothing holds the rail and it is turned
off as unused.

npu-supply is set because the binding requires it; no driver uses it.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 .../boot/dts/rockchip/rk3576-rock-4d.dts      | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index f068794e48d4..72b251d396fe 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -722,6 +722,10 @@ &pcie0 {
 	status = "okay";
 };
 
+&pd_npu {
+	domain-supply = <&vdd_npu_s0>;
+};
+
 &pinctrl {
 	hdmi {
 		hdmi_tx_on_h: hdmi-tx-on-h {
@@ -779,6 +783,24 @@ wifi_en_h: wifi-en-h {
 	};
 };
 
+&rknn_core_0 {
+	npu-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_0 {
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
 &sai6 {
 	status = "okay";
 };
-- 
2.43.0

