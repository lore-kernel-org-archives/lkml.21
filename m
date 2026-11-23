Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458539;
	b=J6dnqBvWepvgplCZFIKRKsoCoj0iPridt3XOPZYYulgUaMxz4GxWKTB3/xkAOD1hRoAe
	 47XAKP9yJdgvf4ThxCJz+e91QncU2F9m47qTKM91chsfqO3QXjfBnTXevTugBG0n0asSN
	 KUjsezoK4en8Eox4AqaL+5bErxXovTezJIb6QoZHXGVcLENWgWpA5gOrVKcw4y9vpgY3M
	 n0im+krxFqFDXPVeMhOuniKC1j2pPWTzSB/9wMMQr/Pri58rsgfsxJaBy8YECi57lmKVN
	 lDcqiSSIce3Oq7spmpo3ymlezRyZKd2Zp0xMT3vQOhlbzdS9j/nndABu+rOv5fIHf7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Sm66atK5a1c4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=;
	b=GyLIxY51ord/cM8aKQtijrw3Q0+STxQSalSBURKXKkXGLgm6YOYzfob8gXc6YMQatrHh
	 fwHCOXN4gm3IGlCV0d7AEcx89NZcnO9QwiQF758IfrZBjXuCrTDfZnIHV7HfATHU0q0ac
	 CeTg8xNP7x0RyCxwysv7eH8k7K1BCs6v0mdwtRv4O77rLqkAOMMiEnG05F+yOUq5cL3iB
	 PnF9WA1WwocoLeQKNM69cl+ITgJSAnSXeYwi3NjfSBRJ18u26aVXm2bpFPhDozYQ8qpQT
	 WwxTMr/KnRdjn5jGAZzF1hOYP1KIyHARDBFD80MIuyEXyp0D2sMgJZmXzOoKX2bv6OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiNeKvG9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EGk2KU6r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1634760A2635
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1634760A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KiNeKvG9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EGk2KU6r
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGl1v1861144
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Sm66atK5a1c
	4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=; b=KiNeKvG9EQ/jqrIVLDZML9PSqFd
	DNln8baOvDpLn3OJB8cmnRSbWdB76Y3WnUVYt7iT2v26U/LoPivaZJVSQkW2Vhmq
	x8+m5MHoWNRp9LL51wywzfrXMTUuMBL6+ECaYVwe9Aa/x+dKrdH6dCkaNnnrTqih
	JapZSD3wCa5ZEPuRj2Rcjc2uewnxQGWCuNeMTJatoZg49Tka9EVhT+ej3eqp+rRI
	P6kTw5AHzuP1+Lvp3/w5KjlTweYLT64qLI3fC//U+qPOw3vwITERqqnO5iS3QtRl
	G6Dyr7WppUu0eJtNnsdQRtkbNYe6qqNuzVQwq1eD7NemUWUNFJSsvxJBxSQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2tbj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:28:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so4505180eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458538; x=1796063338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sm66atK5a1c4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=;
        b=EGk2KU6r5LIh2u7O7gspDdqBhQ1Ebauh3zYfmahEihwkVZGnoLEh0yDxMFyWnYdxvh
         V/Jhdv65eSLYPd8z5Zha90GmCy+6+2BsTNMD/ty1ni+2kBtDRV31qSDzMZTPEB682fZd
         A2obY7dMgScrh+D6v7aIBBdLLpcYGAsiaD4qF89Zqy4zM4XLAbhtSSIGU4HkC23Eqr8K
         4LIbVN+cZdxCN38e5k5uweHAO6/ccQInT9yJDMzQaD2czvo7+U+fCGjZd3GgD1xo/S9g
         7uirdMMDUMLN0ipJdPKMadHeXmGV/LQ+TUOTONlOQVD+B+LiYeS9QWGJ9yDXo4RxEAUj
         kFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458538; x=1796063338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sm66atK5a1c4jXuGmjJn9AG8ISnOiMI7T154hnwnUtc=;
        b=VUzYzYtEcAkvzuqUQ2DaTZA4IErAdTYKNiIm532CtoUtW6+D5ppjTpXAFBN+dt43F1
         R+p4UqUOPHI087dD9asyicUVHAnhUYzfJXmxmH9jR3lc8RUfOeqITD3n7y5EvMWPPnhp
         4qV+7Z43HxuFFkcb3Sztf66Cjg97t/Cb3XB0yEnI+q/8RLl4sr7JrNuyiNbKhmsyPknd
         EAfIZQT0aL9hV9phRfXvSVh+abmIyHMla4XIr67khwERnZegXJqhgLV2cUoi+Jt1XuMv
         52dhjUfBPUpZtRepPA73IS3D5626he4ZMjesEnad/c92bPLC/v6OlitaeSnqdqLI1nd7
         UClQ==
X-Forwarded-Encrypted: i=1; AL+hErGHB2a7cKhtsQSh5IX6ZQkSGNJjFpBCWR1eb7dGs2E6xEqTXI+ZxfvXO5343W/dv6FrduEU6cZLyYKTOFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4dNC+qAIy2vhkhSvH80ynTVrawStdIsYVq1lI/g2HYRnGKQkg
	beX4T9YeFsahjr5BE/fEnqHhAz9cEh6DHzHIs7Z7h63TIA8gR1UzX/eOiejFz06085G/KA8ndMV
	r3Tz4mHCxut96kO261rjo4cNnhzsxeJWDMBweesI3SfvpRRgLaJlR0/dJ9A1lVr8pWmQ=
X-Gm-Gg: AZFdTZda4jQyKv0nxZJx42uUApsBXcyuk5nqy9lwNvLeZXcH+gzHkSk7iFg2ZE5dPf6
	YPNDsaark7w3Dq7CmffScDPC0AnSJPAjUuXgD7I4sdQx4LQDpM4cS+OqM2IuA4nwgdPcyhCyRcO
	KhwPXxC3iSi4LqaIAhf7XhjtYsm2nHrFbBU/hYFyluQM9EN5idAQVmDNwnxQuZ6uGmLlA095pIb
	HXOkwJH8eYHNW0BNIDAeAb81el7S0/RM1BQjlZsCG3h/reLcRdOQli0ZmFLAXlOuiVQne4t3zAs
	CvX6hjQezRwfq/oa2njRmw6np40PxClLIfrDVrdhWFhxt4X1xYxtKVSSivBT8Iuqb/01ekBHKCF
	UY1TXEJ9O6IMbFa6h1uIj2/nFraPhiNFRJUUCHzBizD4pP7dEprQQn/Ofl4EyfVfKfEMyFB9avl
	SdUtqySd1wZ3KQMijznOunBZ8eNg==
X-Received: by 2002:a05:7301:6181:10b0:386:b2ac:1f17 with SMTP id 5a478bee46e88-386b2ac2832mr3423228eec.7.1795458537727;
        Mon, 23 Nov 2026 10:28:57 -0800 (PST)
X-Received: by 2002:a05:7301:6181:10b0:386:b2ac:1f17 with SMTP id 5a478bee46e88-386b2ac2832mr3423204eec.7.1795458537235;
        Mon, 23 Nov 2026 10:28:57 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:56 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Peter Chen <peter.chen@kernel.org>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH v10 7/7] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Mon, 23 Nov 2026 10:28:47 -0800
Message-Id: <20261123182847.143892-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXyUYl1ERb6765
 wAxSmpqqqO4qKBy+jBiBPCF6fviVNqNfHzCNXS1KYi9ypfQfL3Y34bGWlmJ9JPuNRqrSZ5y69o/
 82HKIBzzLG4KgvUYDx28f8YbietIbZE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfX58jta5NX9RPx
 nLGm3mrN2WB70uQG4dQOp297lhD5kUV7tM23u1RknG1finP6zVwq9nsk1ol9NrFuOKWIlM7D4nD
 qP37Jq3/4+xqPlouun2Xo4Anfam1eStlB6Q7OxNyVK1smbe5VPf0tgHweXvIvUzay5DdXyYk1MB
 AaxLqoGoq2bjPfjmuRi33Ti3coxoaGOd2PLz0mk9wAkpRgCj80J5u35lGyILDnA7FObzd8S38Ft
 hCXOwIRdG9Bpm9ENcPCkFzROtmMsXO6QBH/TLSmVSxCxbT0V73JnIzv+e1qLjaU3sxd+lcV4IRk
 Q4kh/nDP5Io7t9M/x3KmB/d61F+wsqEgNWxcHBuTNArigbrm5rjP8aTJNuKM7yhoQwPui73xmwn
 IX8GIwWAZCtKSBPXzB99JyBF5G2HG3ARE/e9Rbqly9Him1oQZEd++gqLZzRRnkMpE1+vGSnrZ76
 mlLyG2FqUil7VBwoheQ==
X-Proofpoint-ORIG-GUID: 7vXWRFQH86mJ-9mvk2vMwcfDxkf72BfW
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0485ea cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=dOwNoGVJVf10FbPJOZQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 7vXWRFQH86mJ-9mvk2vMwcfDxkf72BfW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230073

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index b434b0447613..eba2ace4f3a1 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -313,10 +313,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	path = chip->paths[chip->port_idx];
 
 	if (chip->enabled && path->curr_role == USB_ROLE_DEVICE) {
+		/*
+		 * EUD virtual attach/detach event handling for low power debugging:
+		 *
+		 * When EUD is enabled in debug mode, the device remains physically
+		 * connected to the PC throughout the debug session, keeping the USB
+		 * controller active. This prevents testing of low power scenarios that
+		 * require USB disconnection.
+		 *
+		 * EUD solves this by providing virtual USB attach/detach events while
+		 * maintaining the physical connection. These events are triggered from
+		 * the Host PC via the enumerated EUD control interface and delivered
+		 * to the EUD driver as interrupts.
+		 *
+		 * These notifications are forwarded to the USB controller through role
+		 * switch framework.
+		 */
 		if (chip->usb_attached)
 			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 		else
-			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+			ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 		if (ret)
 			dev_err(chip->dev, "failed to set role switch\n");
 	}
-- 
2.34.1

