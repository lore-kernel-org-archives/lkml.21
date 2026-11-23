Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442182;
	b=e0RZgQ3mZsZMfKBMiaCDyZqsAY4WUjjegif841cEGvFgqECSDciT/l67pvF99kI/RlGv
	 BmBpMv108O+Rlbz0C/cBlZ7cs7qapgpfeW7W6xHTddK2Rx2eQo8bR0Z7cgo3i2qi5oDm3
	 XifHe8v9x9r/jT4dJ4Ykcb/JkgCcI0XAJoJ2Dcw/9J2pyUOEd79WdnfIvuprK3cc07PaJ
	 xa8G3bXu5RT/SFz6g6B0cQOMajupMDq6JBaky2GqQWhRFK9F8uYtViyVJM/UkTXyMBw+o
	 IvIcFf2qT3Ufr6dtBlRbLt+thWWdRd2oq5HLCfZxsmhq7O+QG12nso2IDcjC3nQjDig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442182;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N1oFBv4W0/OF6fkBqaRCQiDB1eU3UHqeJgGqt8r/kaI=;
	b=CYYJWgp21YTsilCedLIaN1Y/MsMWH5YR4frkLYSYFAaIuqT2CUvyZ3+vIAV0D+R2iizf
	 SfAlxqQv7Cz9J/fomioNHuder2WJSj8NNwUos6XK1837PSpVSndOBU0hyUlMKJzhzOKuP
	 6kUHLqP+FhU9+k4CBqZUT/biNe70GH2l7zOQIG4fsxRRs4keVls6kNgND8yw96vZYOWR0
	 J495bfD/HWDtogK4+dj1chARLlRn62VOOs6OiQgsgIhETtF8bpWt/ZcmUAVbzuiK5PiMM
	 EcK87fXLwEUk+o94NqcTMN2BQThdnYmDvLbKNqvKiZ6nSN/tNxIif5jRP6uCGHrQORA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fdOmMSWh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="fy3gp/b7";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11EF606A332
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E11EF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fdOmMSWh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fy3gp/b7
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLNjp445714
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N1oFBv4W0/OF6fkBqaRCQiDB1eU3UHqeJgGqt8r/kaI=; b=fdOmMSWhHzLbu7tC
	X5W9iq3K2KxlFtdWjgHKHcJBCZCctDGQBmA7iF8/YZmvuRAVS5IEVcZvR3Ml+o/N
	7kUuSQIdfr76oZBoXCz1KF7UOVr9mLqp5YoXL3Bi3mEaA5RH/skYCZIH+Senbz2x
	234ImgVJ84yPQQxYZac8VgDneRzTw1b1maQgh2I5C8IWN+duXNdy/dJB4iC06DO8
	ADiOtEw6j7PRR23qMT5hHmo/f7VnmIEmyQNLLcMT2hs+iK0N1yEslY0/KuT3NIYt
	+BhSbaxADA3G9KCxEfMm2oDhCvQVaA/gGvjwhH1KT+PnYZA5qbgBvn9fXYp0ENfg
	gzVIDA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g741n90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:20 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92134f1eb00so49355666d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442180; x=1796046980; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1oFBv4W0/OF6fkBqaRCQiDB1eU3UHqeJgGqt8r/kaI=;
        b=fy3gp/b7z5M3BJSoO9/UV0yauBWn0ViFGIO18w8EzK50itgoebMnEUI055HRNvx5kP
         4ZsdBbUfpIa3DFjWVeFkMEJl+7Ty55ewfHfbyM/DIHgGJcGPe1dYS1ja8odqkYc9MnsX
         gay77aDgiKchBbjaAj2y8mTGb3tvR+jggAJqtusFPFrVKdhN7wHzWWX+coucvik16MB5
         ldyVkITKfaQT2iuSwm3bCiBHrhpYuyHYiJWrFJ4BT/2u/56XE0/u7/wgFh87nh9xkEA9
         ahprfghlkpxmk+J8DnDBdJEfb+TYETF6+7EOz0DAwDj6BhOJCtOH9l+KhJnQWKSQDEJi
         5eeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442180; x=1796046980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1oFBv4W0/OF6fkBqaRCQiDB1eU3UHqeJgGqt8r/kaI=;
        b=o9u+595RvgTxdGY6bTxGtK9iTbd+4gPyqg4WrF/pi6NGKfr+ju1uGqZZDj39Xm+zKF
         oqrndkkP1JplOBvWrKra1LUIxyPfbUVWqV6VfL5V6i0NGIW6aWqxxU8nq8q2hAoKSKAZ
         xH7f20yCkGD83QTHKDclESK50MKbO4Es7sIqGgiQVdOxq9IoTmlNyptnQjVNrMnsZYaO
         JNAZXK5+0g3WUpFqoKtpkF0dw2+IEb8rLXqDX3aC5hmrj5VliTIG3Eio2nV9o6TbWsAV
         wYKJpSYmqK1D8b91FKwOOfcfpByqfQkg+dTrB8h+QngDCZFKtGR67rRqEU+2YljiBCz+
         b4aw==
X-Forwarded-Encrypted: i=1; AL+hErEr1kFEHdlIIsaFRylKM95jKcLE4X1JDbR+YJ1p2dI7T+LNUeOKDIDZEb984/KYpSecs+rKh3naZEgkvOQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z95BaeumB3KiluIe6ivFI6CqkIqpoiOXRN7PkzD+cq4AVnz13j/
	frVY07ugkTSqmrGvgz5VwULT2TGmbqySp7LCE5ytmmu3IBr2Apbsw1UA4tKyQodaYOHtUO66CWU
	EaokYpgzb+BFF7ENURqKkhz1loPdV9p/kFbPqdBXI0lftAhN9qiIYZzCnHqnBa8jFbuyWCeg2XM
	Si0Q==
X-Gm-Gg: AZFdTZc/X0ELNeV3kCPaUyLUIw3Nv/MH7+h7Y/wZ7QJ+BNG6nQZ7V+uHTGcltMbQWAn
	8VkGd+PQ4E0NIEntE7uNrRDzwdYe4xp6+6qwA4wsiPDsn8qKqD1S0LqXdku75Twse3sp6nbntDj
	sBjn1MlLjWQUfQMgeKiUF2QIbiuEty+ta/NfKjWfimaUH/AHGPhD1bdRly8GAUVB8m4sOoe6LcI
	cGDusPQmt7iaub5IKTIURyPU4J/CSTmDbETCbsvG1aL+pXA0AsRAivCklbZkw22KZzibBAhhch8
	jZe0t90fwM9VsFaRdKZjFALFhorpR2gb4fK5ccXK4eSmTVyHjPotPydD+sM/bn99hCgnA1fzTxu
	gsperGvH/Okt+UA3Sha7exSR212V6PB/2Lj13QhpWaxBrj+p23uSW68ljDVNRRz4qeR5SyP6Wcl
	pYuqStQC7JCsVOJKqwcVQ4SXhAekNQeOIms9jCWlmltqdNsr0cX6yjJpdrMdMkl0B9yARutYRdc
	jyODMvFtPOb07kUpwTQsHKTSjc1
X-Received: by 2002:a05:620a:2843:b0:949:a139:2f26 with SMTP id af79cd13be357-949ba823976mr1874148285a.7.1795442180140;
        Mon, 23 Nov 2026 05:56:20 -0800 (PST)
X-Received: by 2002:a05:620a:2843:b0:949:a139:2f26 with SMTP id af79cd13be357-949ba823976mr1874143485a.7.1795442179575;
        Mon, 23 Nov 2026 05:56:19 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21724625f8f.56.2026.11.23.05.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:18 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:56:11 +0100
Subject: [PATCH v9 4/8] Bluetooth: hci_qca: Embed bt_power in struct
 qca_serdev
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-monza-wireless-v9-4-450d7d764aea@oss.qualcomm.com>
References: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: xf_ZwAGyEW2r0Fl1CQ2SX_18PNguZEyt
X-Proofpoint-ORIG-GUID: xf_ZwAGyEW2r0Fl1CQ2SX_18PNguZEyt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX2mYJ/YhL8yPj
 DRCJg/tZGX+4h3amDkWySg6fZ3WLDRdjU9wx7AFVt5pTPCHnimByU54v2xlYM5Q9P0lNC/UELXv
 xv7vigzxixLRFQrrugfENsJHhL0PIjs=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b044604 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=_i6oeMK_y0MRuiu9OnYA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX0nhQixSKHYZl
 /AhXFiMUu68gmYU7YmUf/H8qdhiu2B0o+gA+4u4dUEBikljm1dgAfniKyp6Z3u4+7QbUHMxgJvD
 NAJGS8y7/f9ZTNNjUbskWFUfm9qE3CglHuO58JdmzORnNR5yHVs/HqQKsWYGOPXIGcQFpSa2Xmt
 R3HnGZXZ8KfV4NdEVrGjOB6npstpl9crAiZ14XM5loBYeyEcYQu45lATyr1gQkx6SJ8HZemjIfX
 GqcpbB7aBqgSLj551goCWpp2B6+eV5Ezg+11ZwpSQfihCfhN+QQASrPbiDiM/DToXJiBUgW6isd
 r2F0v0Lh1QVA3znhHfb/yFXYagqRWMhENA0I/pMELsn7hlKwpJf6B3zUNZSNbRVOIdk1mWEvHsw
 dOT2flLkSl2LDUdMzv6moBpw5DuwcoBUar9WgFSj4FYPlwBSWhuQ6tl06E2mvD33DQVFcBGkCck
 99J8yTFPs1kkEhgW97A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230055

'bt_power' is allocated dynamically only for a subset of SOC types, using a
switch on the SOC type that mirrors the one that follows it. This is about
to become pointless as the power sequencer path (used by M.2 modules) is
independent of the SOC type and needs 'bt_power' populated for any type.

Embed 'struct qca_power' directly in 'struct qca_serdev' instead of
allocating it separately. This drops the extra allocation and its dedicated
SOC-type switch, and removes the need for NULL checks on the pointer.

No functional change intended.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 67 ++++++++++++++++-----------------------------
 1 file changed, 23 insertions(+), 44 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 3c0239e837fed7ff8d8261b0c61e5163945d157b..9246abd3492870a6867d12656056d2a5e6490e10 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -226,7 +226,7 @@ struct qca_serdev {
 	struct gpio_desc *sw_ctrl;
 	struct clk	 *susclk;
 	enum qca_btsoc_type btsoc_type;
-	struct qca_power *bt_power;
+	struct qca_power bt_power;
 	u32 init_speed;
 	u32 oper_speed;
 	bool bdaddr_property_broken;
@@ -1810,7 +1810,7 @@ static int qca_regulator_init(struct hci_uart *hu)
 	 */
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 
-	if (!qcadev->bt_power->vregs_on) {
+	if (!qcadev->bt_power.vregs_on) {
 		qca_port_close(hu);
 		ret = qca_regulator_enable(qcadev);
 		if (ret)
@@ -2279,7 +2279,7 @@ static void qca_power_off(struct hci_uart *hu)
 		return;
 
 	qcadev = serdev_device_get_drvdata(hu->serdev);
-	power = qcadev->bt_power;
+	power = &qcadev->bt_power;
 
 	switch (soc_type) {
 	case QCA_WCN3988:
@@ -2299,7 +2299,7 @@ static void qca_power_off(struct hci_uart *hu)
 		break;
 	}
 
-	if (power && power->pwrseq) {
+	if (power->pwrseq) {
 		pwrseq_disable(power->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
 		return;
@@ -2357,7 +2357,7 @@ static int qca_hci_shutdown(struct hci_dev *hdev)
 
 static int qca_regulator_enable(struct qca_serdev *qcadev)
 {
-	struct qca_power *power = qcadev->bt_power;
+	struct qca_power *power = &qcadev->bt_power;
 	int ret;
 
 	if (power->pwrseq)
@@ -2389,7 +2389,7 @@ static void qca_regulator_disable(struct qca_serdev *qcadev)
 	if (!qcadev)
 		return;
 
-	power = qcadev->bt_power;
+	power = &qcadev->bt_power;
 
 	/* Already disabled? */
 	if (!power->vregs_on)
@@ -2466,7 +2466,7 @@ static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
 	if (IS_ERR(pwrseq))
 		return PTR_ERR(pwrseq);
 
-	qcadev->bt_power->pwrseq = pwrseq;
+	qcadev->bt_power.pwrseq = pwrseq;
 
 	return devm_add_action_or_reset(&serdev->dev, qca_serdev_put_pwrseq, pwrseq);
 }
@@ -2501,27 +2501,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
-	switch (qcadev->btsoc_type) {
-	case QCA_QCA6390:
-	case QCA_WCN3950:
-	case QCA_WCN3988:
-	case QCA_WCN3990:
-	case QCA_WCN3991:
-	case QCA_WCN3998:
-	case QCA_WCN6750:
-	case QCA_QCA2066:
-	case QCA_WCN6855:
-	case QCA_WCN7850:
-		qcadev->bt_power = devm_kzalloc(&serdev->dev,
-						sizeof(struct qca_power),
-						GFP_KERNEL);
-		if (!qcadev->bt_power)
-			return -ENOMEM;
-		break;
-	default:
-		break;
-	}
-
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2547,8 +2526,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 * let's use the power sequencer. Otherwise, let's
 			 * drive everything ourselves.
 			 */
-			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
-								   "bluetooth");
+			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->dev,
+								  "bluetooth");
 
 			/*
 			 * Some modules have BT_EN enabled via a hardware pull-up,
@@ -2556,21 +2535,21 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 * through the power sequence. In such cases, fall through
 			 * to follow the legacy flow.
 			 */
-			if (IS_ERR(qcadev->bt_power->pwrseq))
-				qcadev->bt_power->pwrseq = NULL;
+			if (IS_ERR(qcadev->bt_power.pwrseq))
+				qcadev->bt_power.pwrseq = NULL;
 			else
 				break;
 		}
 
-		qcadev->bt_power->dev = &serdev->dev;
-		err = qca_init_regulators(qcadev->bt_power, data->vregs,
+		qcadev->bt_power.dev = &serdev->dev;
+		err = qca_init_regulators(&qcadev->bt_power, data->vregs,
 					  data->num_vregs);
 		if (err) {
 			BT_ERR("Failed to init regulators:%d", err);
 			return err;
 		}
 
-		qcadev->bt_power->vregs_on = false;
+		qcadev->bt_power.vregs_on = false;
 
 		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
 					       GPIOD_OUT_LOW);
@@ -2606,10 +2585,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	case QCA_QCA6390:
 		if (dev_of_node(&serdev->dev)) {
-			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
-								   "bluetooth");
-			if (IS_ERR(qcadev->bt_power->pwrseq))
-				return PTR_ERR(qcadev->bt_power->pwrseq);
+			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->dev,
+								  "bluetooth");
+			if (IS_ERR(qcadev->bt_power.pwrseq))
+				return PTR_ERR(qcadev->bt_power.pwrseq);
 			break;
 		}
 		fallthrough;
@@ -2633,20 +2612,20 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 	}
 
-	if (qcadev->bt_power && qcadev->bt_power->pwrseq) {
-		bt_en_available = pwrseq_is_controllable(qcadev->bt_power->pwrseq);
+	if (qcadev->bt_power.pwrseq) {
+		bt_en_available = pwrseq_is_controllable(qcadev->bt_power.pwrseq);
 		if (!bt_en_available) {
 			/* The host cannot gate the BT power individually.
 			 * Treat it as always-on and drop the pwrseq handle.
 			 * The descriptor itself is still released by devres,
 			 * so dropping the handle here is not a leak.
 			 */
-			err = pwrseq_enable(qcadev->bt_power->pwrseq);
+			err = pwrseq_enable(qcadev->bt_power.pwrseq);
 			if (err)
 				return dev_err_probe(&serdev->dev, err,
 						     "failed to power on BT device\n");
 
-			qcadev->bt_power->pwrseq = NULL;
+			qcadev->bt_power.pwrseq = NULL;
 		}
 	}
 
@@ -2684,7 +2663,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 static void qca_serdev_remove(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
-	struct qca_power *power = qcadev->bt_power;
+	struct qca_power *power = &qcadev->bt_power;
 
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3988:

-- 
2.34.1

