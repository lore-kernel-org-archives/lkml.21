Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429547;
	b=JPv1k8pLVGZCwBkEMX2uO9QdNqA+8+C3mS9Duft3M8HJGDE7TlwIsXM8ntaSLMz6I4S6
	 VLIDhPhwA3H0O2yORU/I2eHq85QvHptWBT/GIgQCGmDkwYKErYj2Jah4oBjEfS5Oisakc
	 IfNlB6d8CQwxNYSdsmsr0GQ7VydeY0VZ0490e7tPAei/674+0PsFx2JNHl7MYuh3tyiF0
	 mZ64jwsA9Dh4fkd0y7RAFv2L0ZgwHyng9YBZ9Keyc76JpIOJv3sBJWANG41df0742nxT2
	 GqU4ieqenGcaLN+3vdGKTsN3jUz0xKXbvQeIs2HjjgvE6n+S0Yol/C9ZAsEiYCiyMHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RyL2h8rRzpp+gpzd2jMK24Y7kpQu0aCp0E5ZMxcZ8dM=;
	b=NHY2as3GpmIHYwyJQ7MDcuXKoXDBhA+IIG3tx47RGEgEQqpVEKPz2UXOUMQ/AlWpgYWq
	 iVpH3Twi+Mp5OXBS3+uuxBg7nvYCwcw+an2Gz7i44wDJWLR5TJEF71pt4MM0wuGnPhsjw
	 m6N1kGt+gTSExTVQWJTCiHLD8p2GykAtOhkjQ9WeFPhuFEbeQh4ZjeSpvVAlEO08zQv2l
	 HGzBOCRP+KQWdqTYSMElwbzr6bhA+tQmY3jHwV542VUF+uVXehblNwbgxsDSbPbgQxJQE
	 etzvPoQZhMB77WfVOpEwTVA5QLsp+m/+kNL1xwV93VtnNCrD8wFW1Q1HiPKDe1f7LVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YQMJUnok;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SdCCE2Ia;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F303606A69D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F303606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YQMJUnok;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SdCCE2Ia
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9IZo83490943
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyL2h8rRzpp+gpzd2jMK24Y7kpQu0aCp0E5ZMxcZ8dM=; b=YQMJUnokdQqqXjQQ
	QmNUh1wJ1gG3fVspCItRgIloefTGB1mnctBdSGZ4q+6QotxjRyY8ofIcB249WSAI
	8mm1EDiYN5YDDxkImKVwssrXBW4jMklrxIJo/IuHoYR973KZ2RDTlwmL9NPwxE+B
	W8bmxqm7EpCeOLQrlq0rAYz1uudJtT8DBkNXR4gFEtzPznyptMTImFxrfPqFT4qL
	PICxDBfXZRxxG0IGMc35U2XpH9w8G6AM/Viopd+ziIqBzCz32Vty9EuCArHxRCzG
	A9L6cupAw33u8vYlHTrvqGpC8zpvmusOO1F/cC+4oMW5hJv+IhvgnZWvCCXAo5by
	wFzHuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsh52h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so503763485a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429544; x=1796034344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyL2h8rRzpp+gpzd2jMK24Y7kpQu0aCp0E5ZMxcZ8dM=;
        b=SdCCE2Ia9lMS24lOVRB6IPL1wQGjR+31eptDmf0xKdvpRE4yTk96meZYlOGf9yyS4i
         fKw9VvFHFmG5rELWJkLVb7kcwM6DeztQfRxUAwdspX6IyFwhqGi7gASuZzQEIHtBG+Qt
         0Wk7shylj4U4t6L1Q/5aQvXSSYRfs0U2LZy2MVM3u4TK+TuZX6/8xA14k3NR1Fk1hh7R
         73saZAT9heW3kui9oHUvEzgmxW+fjPROsmPSMzBA84HgPJm4Zly0oYS80ZlKBSZjLZ70
         rQG82JMe6zBvLvxfv+i6oMcSpPMFnmOiw67gPm38VPh1ulT+BaZAEcPuPy/ttKM8lL7l
         gajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429544; x=1796034344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyL2h8rRzpp+gpzd2jMK24Y7kpQu0aCp0E5ZMxcZ8dM=;
        b=v13Q5qWJY9w8U8mEeJX4bORU0E86N5r00+jbVyQvwI2zChevhQ7xc80SawfUyF5UNV
         DQ10X2c8poD4jwYof+aU06HD0krYQWQ5Bp3klSwH0nKZtLEi8dYyfrhx8TSZODlLrkHt
         pVzddwhp4QcHc8m9cA0yUtRyAg+Iaf7yRmpPrY+AEBAeteSQWIHbNxTSlC8FCkivTal1
         A3oq9tUu5jicsEn0NygVi9ab9D6DID3K0yeSesgud3/YHKTpPnnXrFDuuRoNGfWcmDMe
         vVJX2jOYnwpaI/TCv1IofeYpyaf83fLNi2xKuP9N1fSvSMRyGFreFnjjWVri/5ylDTQx
         7lbQ==
X-Forwarded-Encrypted: i=1; AL+hErEe0Wdy2PFH/tYDI1g1mVxjg4d4XImAPUj0h4L/nMxM52bM+ayiIBaW3mIwUUyps5Cf5YLzeQuhvuYUUxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HnhRBXAhVb55iD6IRWYXHB51O46W82SfNMKO/jNbR7iVwNMEf
	xBpBEXNjruD5xVDKSHLF7OCozf3x8+/ydeYquGR0VxHynK4bX9R9BvuabRZY15H5C7h92zMZqY9
	l3h6R3q9JZUAh6/kZGkQkkLoEMiUQyj1S9ownDkoKXFwDRGFi8rhEKiIgeQzMklYIwVM=
X-Gm-Gg: AZFdTZd5yNVWbHaHOwX3Nxc2D+jFKb68KctGWtBeQQQ2/06ZduHt0I2f0dRYKSOEQCb
	YW2uImIDbpjxAXaFSmfIsUGeaPU3hWxH9Xkq2khmqNlkREM/EOqrUp+Pp2uhspAjsSNdNm/HrbJ
	nTN5Uj2Mo8e4n98Z4OPSG+7T4M8KKWs0Ej7DEVJ/odKGFbxQnuO7v2rhzD77t9OXGkPw+DXWaBn
	DvxYW6ruL6EWSliGQ7gie0Cvyf5+jP8YtVlM7igL5TrhDu2+y71Gq4sS0ZvuFGHXxRFkFw/Q9ih
	7NHx8+HVxNmEbUyNHUIm+xcBK1bpt19PT5+KoKT+ATPYjgr2Fs7d6cO+bY7XQVKYhacAAWXhwNO
	lP5Zfca2+/7YXv7qykKHPi9WOVwyiQOcdBcW7j9JIR6IzBi48vhFyCtmXqDiygMj3TCUIbgxtny
	UQqNXAj80Dgtu3xo6u50LQUIYtJQ7s4gJcAO3lYpWYAktUAA4kBwP60iBf3/ZKLbOTAkVFG8EI7
	qBD8BzI5o0RbR5esL8kz4pfHfmP
X-Received: by 2002:a05:620a:a403:20b0:949:c967:eb68 with SMTP id af79cd13be357-949c967ee7fmr965736785a.1.1795429544350;
        Mon, 23 Nov 2026 02:25:44 -0800 (PST)
X-Received: by 2002:a05:620a:a403:20b0:949:c967:eb68 with SMTP id af79cd13be357-949c967ee7fmr965734785a.1.1795429543925;
        Mon, 23 Nov 2026 02:25:43 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:43 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:36 +0100
Subject: [PATCH v8 5/8] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
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
Message-Id: <20261123-monza-wireless-v8-5-a8b38604be6c@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b0414a9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CW3gqymaXyTMcD2nhgsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: YctVwwJBKrERukuSnCabAL2RNc57dpCg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX/Dcbudn4Yusp
 2D7263q5kPHgZaI1PWIkMarjRQbN3asMNEy+FugVnyraMsJt4c5iT6+EGjKjCvbYPNwygFAVIxq
 bEqCgmtz81cP2jZWOBlYcBlhox/oOpGAHcF7j3QnjknhIpYGX5JF7vzr2BJfmpWGEolUzX/z2F3
 YAXjTvoYrJztNxSgfdWBKmbVU4hlRsUL9Sr8otu8LtJ4oNQKgHCc71GLirdQ20DqnMrf+hvkFlK
 xnad4Ir34s2/b7VsQ9+77YfvnEzbRmaAM2rH+5p9SKq1nD6dmQOADXVBQ2QCMN575FzJb7Mz4WI
 oILqbGmyIlcj/dfSehjU19Q2IQOdiEDI8rYhv8JD9oa+pWm2MeA9AOdYerhZv5/i98GfB8kdod4
 tMnjWybbEzpXvEqmOKiijXplDflPuD6rko9XwQh/GQrPVqBqjksE36DgCQSH/NxxsVSqLqCVslN
 ps7s0u7GMPdpQl9PUNg==
X-Proofpoint-GUID: YctVwwJBKrERukuSnCabAL2RNc57dpCg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX49iUKD8ZvdCw
 s3gH03XMPnzUs1ejRlaks6vjM38dsE/cXSGWH/MRMzKfTMOJB5MofJZUZFvAf2xym51+/RPbg+I
 27lm9l4u1sQgMxQgx7gM3g1KsO0iUnc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230041

For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
controlled by the W_DISABLE2# signal managed by the pcie-m2 power sequencer
rather than a dedicated BT enable GPIO.

When the serdev controller has an OF graph (indicating it is connected to
an M.2 connector), acquire the 'uart' pwrseq target from the connector's
power sequencer and use it to control BT power instead of the bt-enable
GPIO. This is factored out into qca_serdev_get_m2_pwrseq().

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 08efce663eea4344db8dfee2a92eda686d7c97e3..f8b572a5c3d2d373993c49bbdb7f7ae7c9fb9b84 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1907,6 +1907,9 @@ static int qca_power_on(struct hci_dev *hdev)
 			/* Controller needs time to bootup. */
 			msleep(150);
 		}
+
+		if (qcadev->bt_power.pwrseq)
+			ret = pwrseq_enable(qcadev->bt_power.pwrseq);
 	}
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
@@ -2456,6 +2459,9 @@ static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
 	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
 	struct pwrseq_desc *pwrseq;
 
+	if (!qca_serdev_is_m2(serdev))
+		return 0;
+
 	/* The pwrseq is looked up on the serdev controller (which holds the
 	 * OF graph to the M.2 connector), but its lifetime must follow this
 	 * serdev consumer device, not the controller. So acquire it with the
@@ -2501,6 +2507,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
+	err = qca_serdev_get_m2_pwrseq(qcadev);
+	if (err)
+		return err;
+
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2511,13 +2521,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_QCA2066:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		if (qca_serdev_is_m2(serdev)) {
-			err = qca_serdev_get_m2_pwrseq(qcadev);
-			if (err)
-				return err;
-
+		/* M.2 connector modules are powered by the pwrseq acquired above. */
+		if (qcadev->bt_power.pwrseq)
 			break;
-		}
 
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*

-- 
2.34.1

