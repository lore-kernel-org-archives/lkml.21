Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429548;
	b=VTuLPf16om17vJKEte21okpLrHpMLnzKC+1yG53TAWipJEKgeVScZw0RkybfBZ4ST5J6
	 Dp3aEiECixMHsc54suoqT64GLAWGwOR6nc1G9NL1ooODbwND7hUMGZnMTjkA1VQn0Chbp
	 IV+eg/6gBT97LH+XCm8ZMLBAECa9qHsxAFQtbZ0y1pCBrHP86NOHJAxSr3PQTRhvZn7/c
	 BjilHSXq4JgutdBv4wDKelmLLxCcw8IIynt5bzlFP2BQAKSbZYlcOx4oz7r3U1jMlYndI
	 +FsvgDNafhP/Wj8lC/gEoo4/gEjlegPA4lJ9hn36QJRh7YVEC5dnUcuh5W9l8PbmSSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429548;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=K0SlDk7YB1oQ3HfFJc8YyJ8P7ggBeKWAwUxQqSIiUo4=;
	b=NCrkyHd+UUYdVNUrXrFhqZ367fqBa6JIhrGXaEva2qNnhV6ThIL0o5NduiZhbkymbjuT
	 aNXQ/6AjcPWXyfRPOQ7/3Av9+o9GXnGre1fYqo+vAVKXBOea5EF7PAnm4N1JLhvyVEW0T
	 5fNYyQ5gE5g4MjQTFK04IAn0YMdz8W6mwYboClBMXIa91tY6FN2ySNOkLs2aEGPfrwihi
	 V4K2iaTNTNjCB8oN0a/6yoc6ezA9h07oERID/KnBXw8UeiV1jZ2YDBzqA0JN2JghBh3s8
	 VXhz3XGw0JscX2/3myR/hd1RDV8SulBZYPtZHKj3fNJeCm5KHzTmgKpQGFdFkWwlcOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cEH3Nqvv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BIOsEBxy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5D960A2622
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE5D960A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cEH3Nqvv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BIOsEBxy
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G1BY1899311
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K0SlDk7YB1oQ3HfFJc8YyJ8P7ggBeKWAwUxQqSIiUo4=; b=cEH3Nqvv+nncmqHa
	nR/LucgOXQe1ZwZ19Zatgibxe4Ixu2a7fm5qufRD3gJISe24z2ZLFV6qR6h6TLrG
	uWgnX9jk4nL31AzKV5b2PZzu1htgGK8zEcBcrqRe3zjJLXCFgEqXHH5RQZxlUPR1
	09kaYfrHoADAKdgXHLXRQ3Mk9MomQ83WVKvv2uiniypZVPyWrb7Mt5lOaOmQ5VO4
	rmBfvMtfx8T7y+2DOdbZAajS79Zcwhm8V9s3Fo4oM5XC/4Bl8VfupANmMnWzI7Hi
	hrgfsAmYTx5G7E73zBKx7Z008BrnnpiRiEOIjOewxEwqJEzvwjnK+/T9BnAxQRiM
	U1lS0g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k0xkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fbso458607085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429546; x=1796034346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0SlDk7YB1oQ3HfFJc8YyJ8P7ggBeKWAwUxQqSIiUo4=;
        b=BIOsEBxyQc3OxL1fisqfc9rWibZTYjo+ciNsHZfFBUV+/QXuUZavCAO6IloqbE1ZlP
         9OGlKfZ8xCLfG2A+95Afo4NcKjJ4NeXxQwlWf0N1Ds7yTgO2Nm4stCRq7fr8B3dSzyZl
         fgR0a3bAZxQkyvnVyyMZRl+G5/ZVXDZ6T54n1syWp0dUkq4wCj2mAdOSQyPW1/HqU9YD
         XDcRMG9uUEzlnZp2ijmjbTlc747vkoG1RYtHnljOINW78LhWSNaxtJTYCSqY3H3vZpA0
         dj0NIzGxiKUslJqceEjiEf5wLGmoATyMUxtr1Mr1QfX0N1mTy5h5jYc9MG268FUHJs5T
         NDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429546; x=1796034346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0SlDk7YB1oQ3HfFJc8YyJ8P7ggBeKWAwUxQqSIiUo4=;
        b=KNHPDYMWcTntizRpF8v9Rgmn7ZwqqBytl2D2pQJogfKH8L69xFO7IqDxLbTMpVb722
         9UvqlMUtSGmaNqAy+1xjPWGWblK8RUpimKYi9ECDiTEeWmb5yD3wObr1c1PlLESnv5Or
         hgoTI6/uEwfPDpRK8SApxnv9mGd8QrMylKcX4cych6rlY9CFdzKAjf33BHxCpmcDHQLS
         UcYlpBJZltIqkrjQxcsZ/Gk/inq0dTLvkrUklJY0dWDdoJn/Lvr4JDxVCirVUqjPWpXT
         7bNq5bpSeVF47N1zpYcylMWulZmJ6/A1RM++k4Jc/Noqj9tsDgjhl2pXan75AoltyR55
         6UKA==
X-Forwarded-Encrypted: i=1; AL+hErG49SKhxTYoU8RWSifkPdFsgRHthMxH7vyqmd+wKH/NLPsi3ZlW1gSfK7PI1KzSTaWan8f/aGZ0TGQilgQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AAtAOhyr9TFM0HoKddSpGlzH056cnkRTLlvwseJ+hxF9f1Dd0
	lWuN9f3ksNhKDxoURxdjlk+q8zqx5lIpP3iClq9CSXzIlB1STwVv54igITH4nMfuB6VXOo+isiH
	Ug+OuT2pNBG4mctO4lySGdiP3H6lsLdr3VmBt32A/ahiqVNzW4tpUHKiKfGfU0KZZPiM=
X-Gm-Gg: AZFdTZdlX1G91H31kbZHJJ4ZCTlLq1H80wJtV5BkiYaFd62uGKbnlXfjEkokjpSAGJa
	Vexb8h7+hS4rmGeGp8IuTiYrGquot7aygGWKqDfdYmXT6Tyi2bYnh8UQSsUyFtoeu3ZpsLxslSl
	wYaLwSpPenIWU8frknhVZtye3EF3/S6uoQWmN5wcE1IL2+RzNGSnbyMU2rtLc6N1ukno9UOLIHq
	Zp9sFMudcpKHnfe3+G5dI7tOCEepA+yvWCb/umui7LsySC9c6FfutaV7qxyn1EflAa/bWzqlRlr
	1VFbWjw5anVlvhPzgqKCDFY928VeW+4e1RaD2wA0Ua5bPY0COiv+AwoKqU2tel+iSszcvmL7/tt
	jdK6f/5Ekrxu0nMeYaLQeeRqtmvVqbPoXlSI+gv+XrZtfjJpSmfM9jV1rTsngu/Tj4+92achZzK
	ETLQxeMcmDiHhazJ1rrmFhZGN2Hr/rsbrbtIKbUNRnSBoIGJfIQ308WMoVKoGg7EwfsIBlndVtd
	GeTa4s+vw8ziKYvg8MX1RnDk6mg
X-Received: by 2002:a05:620a:4551:b0:949:7270:a7fd with SMTP id af79cd13be357-949ba99424amr1822912685a.32.1795429546099;
        Mon, 23 Nov 2026 02:25:46 -0800 (PST)
X-Received: by 2002:a05:620a:4551:b0:949:7270:a7fd with SMTP id af79cd13be357-949ba99424amr1822909185a.32.1795429545533;
        Mon, 23 Nov 2026 02:25:45 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:37 +0100
Subject: [PATCH v8 6/8] Bluetooth: hci_qca: Flatten struct qca_power into
 struct qca_serdev
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
Message-Id: <20261123-monza-wireless-v8-6-a8b38604be6c@oss.qualcomm.com>
References: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX5nlHtVOD7Zza
 kxwUFF4bdhs9bw550rF8yqrdoAzBhrSufAqHoAWwRP92uddPTDg7P9yl+ox2eKFfjZu0f8GPw9n
 u/bLvhJHlcmL4Il3mWNHLrVx9AWe4Kk=
X-Proofpoint-GUID: MSkg47gRC_HaDCuRWbq4G6og8bKMuE91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX6e4EKu8h+ov8
 fc6/RjzvUFnqwb3efNfeiET3W3eInDW0db+XB1JCE3tsiRgEXXUcvGa5doPeRy7deCCA29yyu4t
 VTJWU9J+JJjh2Vb+rrql+CkM11E4TDvEzZWyo2ocKiZ9nepv4YySfjVy8SZX4L2bjpnrnvBVKlq
 4qxDYptqA7HYMBlUN5cTS0O4GYBEmBrzgAhTw5jj64RKPJvNmJXsct7H0mjyrV6YdGoizbr8+78
 Fa10s5viKQddHUHywTZt+x3h1M0AqtaDlrdpQ0DZvFC/lNH2AyunOzj2KYsCYh90a/EjG6VVgIa
 LkiLbWGOkn5Zjh7iA6AFdgpwkXCQj4UVZt3Yn4NyDOCwGG/oiVRXWc9uJWaNThNEc5PXv6SkApj
 AAs9hDNu5qUZ662/ss9jEibhH5kvRZFTijKRYlIGQHngwY21b5pKWtwrde+2Jc1cB6Gg4uAglm7
 Bl2T4/FejJVG9OXndLA==
X-Proofpoint-ORIG-GUID: MSkg47gRC_HaDCuRWbq4G6og8bKMuE91
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0414aa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=tAWmpyBk72D6OgzOTXEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230041

struct qca_power currently only groups a handful of fields
(vreg_bulk, num_vregs, vregs_on, pwrseq) that are exclusively used
from struct qca_serdev, via its embedded bt_power member. The extra
indirection level does not provide any isolation or reuse benefit,
and just adds qcadev->bt_power.<field> noise throughout the driver.

Drop struct qca_power and move its fields directly into
struct qca_serdev, updating qca_init_regulators() to take a
struct qca_serdev pointer instead. No functional change intended.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 95 +++++++++++++++++++--------------------------
 1 file changed, 40 insertions(+), 55 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index f8b572a5c3d2d373993c49bbdb7f7ae7c9fb9b84..0074170c49a2a4b46b7a5fb55c9ce83861bd77a7 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -212,21 +212,16 @@ struct qca_device_data {
 /*
  * Platform data for the QCA Bluetooth power driver.
  */
-struct qca_power {
-	struct device *dev;
-	struct regulator_bulk_data *vreg_bulk;
-	int num_vregs;
-	bool vregs_on;
-	struct pwrseq_desc *pwrseq;
-};
-
 struct qca_serdev {
 	struct hci_uart	 serdev_hu;
 	struct gpio_desc *bt_en;
 	struct gpio_desc *sw_ctrl;
 	struct clk	 *susclk;
 	enum qca_btsoc_type btsoc_type;
-	struct qca_power bt_power;
+	struct regulator_bulk_data *vreg_bulk;
+	int num_vregs;
+	bool vregs_on;
+	struct pwrseq_desc *pwrseq;
 	u32 init_speed;
 	u32 oper_speed;
 	bool bdaddr_property_broken;
@@ -1810,7 +1805,7 @@ static int qca_regulator_init(struct hci_uart *hu)
 	 */
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 
-	if (!qcadev->bt_power.vregs_on) {
+	if (!qcadev->vregs_on) {
 		qca_port_close(hu);
 		ret = qca_regulator_enable(qcadev);
 		if (ret)
@@ -1908,8 +1903,8 @@ static int qca_power_on(struct hci_dev *hdev)
 			msleep(150);
 		}
 
-		if (qcadev->bt_power.pwrseq)
-			ret = pwrseq_enable(qcadev->bt_power.pwrseq);
+		if (qcadev->pwrseq)
+			ret = pwrseq_enable(qcadev->pwrseq);
 	}
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
@@ -2264,7 +2259,6 @@ static void qca_power_off(struct hci_uart *hu)
 	unsigned long flags;
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 	bool sw_ctrl_state;
-	struct qca_power *power;
 
 	/* From this point we go into power off state. But serial port may
 	 * still be open, stop queueing the IBS data and flush all the buffered
@@ -2282,7 +2276,6 @@ static void qca_power_off(struct hci_uart *hu)
 		return;
 
 	qcadev = serdev_device_get_drvdata(hu->serdev);
-	power = &qcadev->bt_power;
 
 	switch (soc_type) {
 	case QCA_WCN3988:
@@ -2302,8 +2295,8 @@ static void qca_power_off(struct hci_uart *hu)
 		break;
 	}
 
-	if (power->pwrseq) {
-		pwrseq_disable(power->pwrseq);
+	if (qcadev->pwrseq) {
+		pwrseq_disable(qcadev->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
 		return;
         }
@@ -2360,23 +2353,22 @@ static int qca_hci_shutdown(struct hci_dev *hdev)
 
 static int qca_regulator_enable(struct qca_serdev *qcadev)
 {
-	struct qca_power *power = &qcadev->bt_power;
 	int ret;
 
-	if (power->pwrseq)
-		return pwrseq_enable(power->pwrseq);
+	if (qcadev->pwrseq)
+		return pwrseq_enable(qcadev->pwrseq);
 
 	/* Already enabled */
-	if (power->vregs_on)
+	if (qcadev->vregs_on)
 		return 0;
 
-	BT_DBG("enabling %d regulators)", power->num_vregs);
+	BT_DBG("enabling %d regulators)", qcadev->num_vregs);
 
-	ret = regulator_bulk_enable(power->num_vregs, power->vreg_bulk);
+	ret = regulator_bulk_enable(qcadev->num_vregs, qcadev->vreg_bulk);
 	if (ret)
 		return ret;
 
-	power->vregs_on = true;
+	qcadev->vregs_on = true;
 
 	ret = clk_prepare_enable(qcadev->susclk);
 	if (ret)
@@ -2387,38 +2379,35 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
 
 static void qca_regulator_disable(struct qca_serdev *qcadev)
 {
-	struct qca_power *power;
-
 	if (!qcadev)
 		return;
 
-	power = &qcadev->bt_power;
-
 	/* Already disabled? */
-	if (!power->vregs_on)
+	if (!qcadev->vregs_on)
 		return;
 
-	regulator_bulk_disable(power->num_vregs, power->vreg_bulk);
-	power->vregs_on = false;
+	regulator_bulk_disable(qcadev->num_vregs, qcadev->vreg_bulk);
+	qcadev->vregs_on = false;
 
 	clk_disable_unprepare(qcadev->susclk);
 }
 
-static int qca_init_regulators(struct qca_power *qca,
-				const struct qca_vreg *vregs, size_t num_vregs)
+static int qca_init_regulators(struct qca_serdev *qcadev,
+			       const struct qca_vreg *vregs, size_t num_vregs)
 {
+	struct device *dev = &qcadev->serdev_hu.serdev->dev;
 	struct regulator_bulk_data *bulk;
 	int ret;
 	int i;
 
-	bulk = devm_kzalloc_objs(qca->dev, *bulk, num_vregs);
+	bulk = devm_kzalloc_objs(dev, *bulk, num_vregs);
 	if (!bulk)
 		return -ENOMEM;
 
 	for (i = 0; i < num_vregs; i++)
 		bulk[i].supply = vregs[i].name;
 
-	ret = devm_regulator_bulk_get(qca->dev, num_vregs, bulk);
+	ret = devm_regulator_bulk_get(dev, num_vregs, bulk);
 	if (ret < 0)
 		return ret;
 
@@ -2428,8 +2417,8 @@ static int qca_init_regulators(struct qca_power *qca,
 			return ret;
 	}
 
-	qca->vreg_bulk = bulk;
-	qca->num_vregs = num_vregs;
+	qcadev->vreg_bulk = bulk;
+	qcadev->num_vregs = num_vregs;
 
 	return 0;
 }
@@ -2472,7 +2461,7 @@ static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
 	if (IS_ERR(pwrseq))
 		return PTR_ERR(pwrseq);
 
-	qcadev->bt_power.pwrseq = pwrseq;
+	qcadev->pwrseq = pwrseq;
 
 	return devm_add_action_or_reset(&serdev->dev, qca_serdev_put_pwrseq, pwrseq);
 }
@@ -2522,7 +2511,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6855:
 	case QCA_WCN7850:
 		/* M.2 connector modules are powered by the pwrseq acquired above. */
-		if (qcadev->bt_power.pwrseq)
+		if (qcadev->pwrseq)
 			break;
 
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
@@ -2532,8 +2521,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 * let's use the power sequencer. Otherwise, let's
 			 * drive everything ourselves.
 			 */
-			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->dev,
-								  "bluetooth");
+			qcadev->pwrseq = devm_pwrseq_get(&serdev->dev, "bluetooth");
 
 			/*
 			 * Some modules have BT_EN enabled via a hardware pull-up,
@@ -2541,21 +2529,20 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 * through the power sequence. In such cases, fall through
 			 * to follow the legacy flow.
 			 */
-			if (IS_ERR(qcadev->bt_power.pwrseq))
-				qcadev->bt_power.pwrseq = NULL;
+			if (IS_ERR(qcadev->pwrseq))
+				qcadev->pwrseq = NULL;
 			else
 				break;
 		}
 
-		qcadev->bt_power.dev = &serdev->dev;
-		err = qca_init_regulators(&qcadev->bt_power, data->vregs,
+		err = qca_init_regulators(qcadev, data->vregs,
 					  data->num_vregs);
 		if (err) {
 			BT_ERR("Failed to init regulators:%d", err);
 			return err;
 		}
 
-		qcadev->bt_power.vregs_on = false;
+		qcadev->vregs_on = false;
 
 		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
 					       GPIOD_OUT_LOW);
@@ -2591,10 +2578,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	case QCA_QCA6390:
 		if (dev_of_node(&serdev->dev)) {
-			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->dev,
-								  "bluetooth");
-			if (IS_ERR(qcadev->bt_power.pwrseq))
-				return PTR_ERR(qcadev->bt_power.pwrseq);
+			qcadev->pwrseq = devm_pwrseq_get(&serdev->dev, "bluetooth");
+			if (IS_ERR(qcadev->pwrseq))
+				return PTR_ERR(qcadev->pwrseq);
 			break;
 		}
 		fallthrough;
@@ -2618,20 +2604,20 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 	}
 
-	if (qcadev->bt_power.pwrseq) {
-		bt_en_available = pwrseq_is_controllable(qcadev->bt_power.pwrseq);
+	if (qcadev->pwrseq) {
+		bt_en_available = pwrseq_is_controllable(qcadev->pwrseq);
 		if (!bt_en_available) {
 			/* The host cannot gate the BT power individually.
 			 * Treat it as always-on and drop the pwrseq handle.
 			 * The descriptor itself is still released by devres,
 			 * so dropping the handle here is not a leak.
 			 */
-			err = pwrseq_enable(qcadev->bt_power.pwrseq);
+			err = pwrseq_enable(qcadev->pwrseq);
 			if (err)
 				return dev_err_probe(&serdev->dev, err,
 						     "failed to power on BT device\n");
 
-			qcadev->bt_power.pwrseq = NULL;
+			qcadev->pwrseq = NULL;
 		}
 	}
 
@@ -2669,7 +2655,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 static void qca_serdev_remove(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
-	struct qca_power *power = &qcadev->bt_power;
 
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3988:
@@ -2680,7 +2665,7 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 	case QCA_QCA2066:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		if (power->vregs_on)
+		if (qcadev->vregs_on)
 			qca_power_off(&qcadev->serdev_hu);
 		break;
 	default:

-- 
2.34.1

