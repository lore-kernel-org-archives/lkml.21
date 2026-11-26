Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685791;
	b=fsBnoKHNaQxSHcIEGnnoLxruHMUiLQtExZHwW1V7xXyp6yiQwar5hogz3fXBTvw9lbzT
	 Fv9dDUSsIRo44FNoqi/pcHrFdtKTV9UUfcal5yCB0OE1kffONti8QuseEeglma4xrTXoQ
	 wzZz/QSqzGO5PEAacbiSEF1/ARHHsP9ecy1ErwHoJmc64n6lOo/QO3eZIho8qMyPJYO9/
	 hrAze3ntzu4vDhLlD7wvwNPBYtSkw87dtBwSIZ/romEKdY3Fb5+tRVAVuOn1kFtJsDASv
	 okznxKv+Yo7d6qu04aShMzlOwnPAH2DD43kx+t6oWYGj5s5ixnlJUwoQcnedkDQIVXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685791;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
	b=qLNyUYGj3kat3pKqqV84JzwBHN81O7Jy84KnpKZT4yERpn5BQjUVI60MNPaZUhSmxWeE
	 xa2rKJEHsWOIthjhiKycfAojj2EgGXzlwXkJeJEXXLQ2U/6o6+m0Ld1+Zsju3HcwV8R25
	 PXpmcost+oytilyCw7A4AvhztNaWjpxSghSwAHwLxoH9oiu8X2vPVnu/3a2MQa444LiyB
	 VTksheZUeznGJ5K2PrL03eg5QCih8JBpZGTXryTRQ8ABj2KbHz9LVF4hujPaRZop9h2SW
	 OG4oklGpg6tloV4C8WpI18R7iE53SPBR0Bk7N5jC4DdrwVES245Cda5d2Qb4eM69BmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvTU+1Lr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMZDCdq8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0E7606A696
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A0E7606A696
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvTU+1Lr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VMZDCdq8
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B7dS3548440
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=; b=HvTU+1Lr0+TayoIV
	jjYxb6eyo99o+UgT/AVaicpY6fcDbW1BMaAX0d223RgCG3hu7zG9AVl6pJuaUzfy
	Eks6iYYvykbAa2pKrAnT6sHg4oGwjRknvKzaDP8pNRX1tuNpAFRhcbcWwkBU6m5/
	wbncP+VOqEGGJcwgS7ZZFH6WAa401chJSCR/I4qf1TDjTT4xmNYPjFoVTAxnCyoX
	k3iAh1KQl0yjEWlKbBQpp75dMJQin2AIa3TVJv7H14t3+3icXGyUAEGtcSJm0pSX
	kQ0WWtPX+r+owfwkZwxH/uyHiZtARvdH8Trx+pPCSIzMCaa7KXk56rJEYFFgbXRl
	mixz2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vauad8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so276531785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685789; x=1796290589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=VMZDCdq8Jhiau+uf9VcKBg0uuapDL6IcC5y2d0p2II1nT0Lg1xcZwHL+Oe7E9++3Rx
         A1chdFopN+I0gOs1gbN20WdsHbR8Eu1IMmyrrZeH/IU925FxO4dMIYI9Z0bbqw6mAcCM
         EavIEhbs0qF5KgR0DuBdWxa+RWyJ7AQBcEF7MBHsG/rT6BTVV1w8p2s2COzSrOAFRLnd
         +rVMEnbgEiSRPbEyGwlEa0oR92ExmtXk8fABR64ZS2lidV4h0aB9hfWdKokQIvfi7ON2
         qzr9o7AubfEg/ndAqMf6p2M0BDs+D1wGjSQIM/xkEfQl5z8k8m6Mhi2WD9ZUlTo54ykT
         lpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685789; x=1796290589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=EWGoSwWyiWlGMTL38tYiXkESiTQlp9k3+q1x/+ykK3IPqKEN7FgG03UZcZnLTlIWJB
         FNyLTdSKGDPat8U6SLUW7I3b9LlpfyJMiE0e9OkXBbZUHt6nesVrxTLKNa28QQLdGm39
         TBpGJZXK9o5HzR3we7cPXinzQGBlqeZTZhYuod/SImbCyzvm/Xw0z9P3tDMNU3Y+aLKl
         YdVq2hKkdqqEucpOlNLH+5+yQgoSJOpPircbPmXUzg037PbtQ5ExedON0ALzJBixyOqE
         Yv0rntL11vGMNcp4kw4y+WdpmhjTzIZ1RbgmbR6zHAYEwBAeKLt3vVZ8mHC19zAr15VX
         pW2A==
X-Forwarded-Encrypted: i=1; AL+hErE3HiADHx+P5k2suHxxPWSkCusYe9pwhNYewuJX7c4zL0gkk0ZfSlzNq57wNhq4qiww3KF+YRqRO7pPED0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4BPCvZliaEKazgZJhNICWkJLAyu88acYd3FwrPzvjlY6HY84J
	EFdZW0ktW6PJhT7P9DQ/RU/Nw4Tts1wmT0k7FkfAhDCX+zTYft9O+4mILAgYLmRCGdvahDeOwVy
	E+vqypjq+5iC0pBXROhp1JDZE7YBOqBH0hFU3n9Z6L6QK9PF3xs+R6DvJTLt0qOQKgMc=
X-Gm-Gg: AZFdTZclAPtgCt0MFhgVc91U8ypwZIBMhJ6vH/ct8bjn/fkaK7MQ8A2RcpQULksyzis
	Xe9X/sVqNFOJHb6vQpWh/12Vh5T/jW9RsLlJgdzvZgQQAo9CvQTX0Y4InHr6pvO0qjxvkUa2H9w
	TiE7swZWlypTP4U2ZM8MNY7A9iV34bpDFMWjwiafbm/XYdZQv0MVDZKdSE8rnHAGuh/Bt5OQwC8
	pilhtFLC+uqN/oVKqMF9HdIgY431ItD5Gl2PKD0XyKt0OJo0lKM+iBAEwU7HgfkXwzjNF4ZVB5U
	8g0d/BqL7Huv9yrXnZ0KhYYeOVFBFU5N4TtXrmILmYjovCBcc56h96p4CBLSMtFxUi+FszxsGYe
	XYouped0JbLnO5NZB9S7ZaRnRY37MeVJITAuIGv44a23knTxYwSRFHTnmDPiHPKT9Qq+iidp++6
	INgQ==
X-Received: by 2002:a05:620a:2a0a:b0:93f:43a4:a47e with SMTP id af79cd13be357-949bab1dadamr3832610685a.43.1795685788799;
        Thu, 26 Nov 2026 01:36:28 -0800 (PST)
X-Received: by 2002:a05:620a:2a0a:b0:93f:43a4:a47e with SMTP id af79cd13be357-949bab1dadamr3832608285a.43.1795685788429;
        Thu, 26 Nov 2026 01:36:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:19 +0100
Subject: [PATCH v4 02/10] lib: string_helpers: implement a CLASS() for
 string arrays
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
Message-Id: <20261126-fwnode-for-each-prop-v4-2-d4b370ecfd52@oss.qualcomm.com>
References: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
In-Reply-To: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JgjwkDVUHWhy6uin4cUa0Wd2V5XuhJ8xnn7npsp7KAA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UmlNPXMYUFj1OkyjJlNtUg+TUKM1XF8Nu7
 d7XYDXF1R2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w8xCD/9IYhGx3cvDc9WQWKHuSblgrzMbds4fs/OJHOvppEcKmijm7eXlATdeZIwTvT3isiBUj4X
 vMkHZeEcEb3x5E6sPII4oL2sLrwLi6Sc0G687C90sYbHjuaF/cvPNwQ34R53OhVsSusUhpn8UHL
 ba9XnX808PqRAwtsHkPJei/FdYKzTAjyLVJTlIjXVh8ePI8zN6IjdXJRCSsPodY5I64A/swlRIx
 fpIfZWyra+oHPh/oY6PilA0cVcLLOLrKe/pvRKp6RxQaCenoPI3s+HYRsODp8vMD+YFabDJRoBF
 Ttfb9xQb8DiNf6sW9Vs6Hz4vwtoINt/h2jzIRwaRntNqP9wbgGcgdDZCMqoSXfX8XPLJ0eY401A
 SlgEgNSWLenIYKcrGhH25okc+JMMYO3oJ55c6yKNT4XbAxUTpMzsB7obKMj/c3dWzHJnQ9QoJ7h
 pqZ2qtHyWZ92+t7QLHW8TqRS7pvmu7vuvBeAJOSI4K3CkAzlm5XUE6Y6NOs72ti+GUvdN9Kj0KD
 DMwOqA0PUUR/Rz379B1UlFOzYoGhxCGxC7Kkwy90FcAsR9whZuHVEf6/oVrPLf6K244LKS7AlzP
 AC6jyUhZAuwrmwu0In9diKO6B6mIe7ozf7LbBcG5/Cl8f9QkcSYK6xla6At0MSFKKhgCB7waqvE
 xLx5I9axDKDlkjw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX2KdhN9ytfsDM
 zRYFCWsPQFMsQqiDWclPVzT5G0jiPL6zIF8sTrgDAYM2IoTbRDZ0LN2EZJ/bn37OvNFQhWsNod8
 eX05ydvN9cq8VTropUCGYj7IoPVjNsM=
X-Proofpoint-ORIG-GUID: 13fevHGGCerpQezH8zGXJeyMfCITQ9Tx
X-Proofpoint-GUID: 13fevHGGCerpQezH8zGXJeyMfCITQ9Tx
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07fd9d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX2F3O9qOxfZgM
 ep6Ye6L2GAtBq8nS4eT2Zk3t2etPV16CLiJUAubpITKJrrBcMR6IX6vE5/x7iSZIBP8cbo7EGvz
 +G6pEDHoQInaIdCOwVEfFmjaw9dBp7KKW/38Nxm0hUN1MCJtrFgVj08FHsVYvidHyqtGapUDGJu
 2aqVWhA+i+eesCszL6o0b6TfQU9ZEGX+P3Au3LBtcqc8S8aqwBOKWF9wD82YfEX5ImXIG2n9R77
 EQNl+yxDViFdDvoSRFSYCeFMnU1yiZRmmeiEFfBKgmr/49HklnBc76w0Zp6or4G5+SUSH62poVn
 0grg6mcFIXVz0bvD6X1D00UIzR5fle1sle7DeUTtss+JRYQgEIGsB55ZfMTRiGVNYNAMAqnT7ht
 Cb2vtEtoX8U9igNB7mV8gUzcjF2SMlekdah6jWAKS6226o6gOCTTbmJl2ClGMpM7yfJrXjDXPy5
 QxxR7p6PauZpsOKAH0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Provide a CLASS() for managed arrays of strings. It can be used for
automated release of temporary string arrays when they go out of scope.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/string_helpers.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/string_helpers.h b/include/linux/string_helpers.h
index c9f08066439bdd33cc26e2054dbe1ba2e867aee7..4db73bc7d4623cf45954cc8794c5baff6fb23241 100644
--- a/include/linux/string_helpers.h
+++ b/include/linux/string_helpers.h
@@ -3,6 +3,7 @@
 #define _LINUX_STRING_HELPERS_H_
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/ctype.h>
 #include <linux/string_choices.h>
 #include <linux/string.h>
@@ -124,6 +125,12 @@ struct kstrarray {
 char **kasprintf_strarray(gfp_t gfp, const char *prefix, size_t n);
 void kfree_strarray(char **array, size_t n);
 
+DEFINE_CLASS(strarray,
+	     struct kstrarray,
+	     kfree_strarray(_T.array, _T.n),
+	     ((struct kstrarray){ .array = array, .n = size }),
+	     char **array, size_t size);
+
 char **devm_kasprintf_strarray(struct device *dev, const char *prefix, size_t n);
 
 #endif

-- 
2.47.3

