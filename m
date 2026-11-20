Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178818;
	b=Lq6JiAYHz5Rx/tmnaqPJYkSTuFsJqIZ/QwL2E/Epd/ENzhpjsSFauKrLwkYRW1IBkgK2
	 BpshWvDATocuoCLTl1ECHLKxD1UdFEUnM+jtEOnG1HpTnNEs8lGETcqixdQXNlWqsm6oP
	 4WSrf3+qfy0Pbhtg4SSCYDhCyJyHYu/TsSYtRdP/VcrMhliHq0rs0s+rObJ3VtJEoofAi
	 B8/EDSaurzLzPdrnpn4Khp5HzvNxfEN8mzqsBfAeRhgu2UWjLMoJSUegKE7OaqmuOLRXy
	 J3j2LtZCUJvnI3tuOhiSsYk969i0KunxH5rZpJWv0XXy9VH7XjCfYH75Ek93tJrY+FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
	b=ojyLPojVKbKn1UN91C7hJUizS529jGVTQ1W+awYtGNPMZuXAlhYzO7/WKJPYbphVqrPo
	 xFWiFVpZiP/FFGzk0cSWyczr9WuFrYx/rMo2i5w2wlysbUrHNg4+edekvmGOCNO3oHXVf
	 lW0q2v0eugMzpFSbkO8CFSqfoOZLf42EYa5Gh6HcEiMh/FMFNKvhC9trb+ucfh1GV/uYH
	 GoMbqoMcGh2ksxX4+lUUmfAKbT3ELB86QJnTuZd1zZ6UlJzAmUgsX1GOAPG1ukXrGF50M
	 MrDibEn0q6yR3R5UGzvfp9eyRQ0jAa/EpGh8SnZ4IVbmeRl4i3f9/a33DQJNhAv4JKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OL7mQEHY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fN8sYdq+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA32606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA32606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OL7mQEHY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fN8sYdq+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtqZ1528517
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:46:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=; b=OL7mQEHYCSQc+cj3
	MZmSyugOTRomMWlrOXLRTXLiwpIxJDgG/m7xi4pfX7AnWWlTSLYM+oLaQLDqZvAz
	j4yfa8Z/zA619xCf2Pk6aHff9oCsH1NN8zOOuqOSsR7xjMk7/8XFA7Uunl8n9oWD
	C+QCD6TQ835NRVubbiiE3sDruxE0ENoF8reK0pwiR3R2+9Zy8h7wzK9qXiDIxKoy
	zrEwv+/In7+AY6UeVDEY/2xiGRHaVZioqOBqn9JB9ELncCBjS/V4seeTnAbYvy89
	VVDZCWkTMhHODFhx5sC6jPH2KJDq3fICfE1sFC3QfTNyjyJzrb42MVAVXY805RxC
	92lkrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtsvua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:46:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495dd0f07eso169054585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178816; x=1795783616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=fN8sYdq+EKflVYz0UK7UfzO9F/QWxGcXj72hVKgD8S00jtQ3Mmz9PurVsthbNiKri6
         iGe6WdiOiD6UQdLCPEGXhejvubNbHYzY4r2vZb8W02tIAQp1F48P7W4Q1fXBtwLfMyyC
         /cBMSe3DpncOgp3BZjD/FbvUq82iqt77LG4w6dM+6+UnCxyXYHTd5oaa17LaNymUMTCs
         wjoGNeY0WS0SfrPPhpRTokpaeQ9GnswVzlx+nKbw/ULlam8ocZXmTe0CcR++yFOjtecE
         ODlmWUbN6rpD4lArqxxegzAYKPpaj4m3xX89B+aItZPFsxkDMJmN2KORWANR7Sd/gpTe
         2A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178816; x=1795783616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRIovGB/GYq3DzNOvm/z3TLZdByFS+QCwZOU22JFuqA=;
        b=crLM9XllE/I8Y9SIYgs1T4DfMXKYL7voix9VDznAJXTQd1TmdBkGDLN5tm3dtrcn46
         LzFoQwRmmDWeJJuw0u7mncqVuOWdyg/XeAZbRb1qPyirHXaEwwmHDzRieBCVTq2/1zQL
         ACCSINy+Aava6VI5CIikYsaDdh5H4h2Uf9HYsMsfACu+m4jMzuFXjRc9FuPp3ZEn5217
         Kds+sM4dJKtzdFpESEWegdPniUjD3FKYVad9fiThdoxrJQNaZmgd43FylF1axg7gFLGJ
         xjLDt0Z+NmOui1TNyhm5k3VLqh7Twt3f94oCJIskE//iGkbHVRY4XN8JPUoLYJ7UOyDn
         FkyA==
X-Forwarded-Encrypted: i=1; AL+hErEr2EIH2FxMKxKTFsXfOwxI7AZ216dqZK1NvYOfI+hvwR95dWT+gfkQjZi2+jr08/3CeCRUDyzh+5NH1Zo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m+i959ApfgAuAoFh9zXKEVUKzHbHDUOGaHmrXd2ZeBWURgi57
	spedmHQuYoLzDIMzGvjImvhNMlts4QkdPD8I/rZSikehsoBkkRcsHBUH/3ATcBYqKdmWOvG6SGS
	+XcwCMcSu37yO7jz8xnepePsaiZqxBTlm8ZUuRf6+IQzoddFFmer6sB7Yd8yxL927t4o=
X-Gm-Gg: AYBFou1D62U5UdktY/g4rDm+7bpBTvvmQUTb6JyOQT1WM/1dFQG6wnwdxwNhIoyPL9v
	A6JN92NTNgP7l0pjpNHxzslIRwgRvuO9hoiLWgBgvqvy/sjsXG1QfsUMWCc3/mdTklVsHMsX83J
	PG7f0fnDmBNDI06dPmVP5/z2Ol7pForT/4yPU9gKVJGZX9z/ZJLu8F3QrH1loQFy+qOCFNPjYqz
	KzlJ2LF7Z+fiEZGOv0gvpvXYzlkVYkZ/iCRBu8Q8QomgoaWCQEIuQOK7bjWoO878EzwiPL+gtR0
	pa20jmtTGGV9rZLCvtYhhMCeFglFnGTSZYyIIRpYjFhe8ep53+1absMsnAfUwK7/xDAr+7ufOdV
	oH5KKgjBqi4SLLc7K8a+uhzyeM/WryIi+dz+ft83YK5T2eONmw+VyfhgjIOm6h5jN/5evrmheYS
	4=
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id af79cd13be357-949ba9c31bbmr464268685a.30.1795178816379;
        Fri, 20 Nov 2026 04:46:56 -0800 (PST)
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id af79cd13be357-949ba9c31bbmr464265285a.30.1795178815926;
        Fri, 20 Nov 2026 04:46:55 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:46:54 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:39 +0100
Subject: [PATCH v3 02/10] lib: string_helpers: implement a CLASS() for
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
Message-Id: <20261120-fwnode-for-each-prop-v3-2-808e304dc73e@oss.qualcomm.com>
References: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
In-Reply-To: <20261120-fwnode-for-each-prop-v3-0-808e304dc73e@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE2jLXmZl1uQUBpEf+eKw/T3UBW/o8UeMEbm
 +gQPCy9bhCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBNgAKCRAFnS7L/zaE
 w6OaEACp2HMa3L5w/tLsNIekUn6RV5BW14T495b4IkQjhG9/ndutwkWQh8k7Rk+kY8zCzHvUpY/
 I7kDBzNwwAbAaBNTpYUI2PHBTLTM5NxV/844KBjNOzxvdZib+uxEvQfVpb1z4COHby0Ps4GVQ6V
 qo9cCpLSdcK4x+eTOMDrdsUaLphAdS59/wpD2hdOq4wB3IG227nQOGq8yPhk1vyZ5Y+5QDYy+n9
 Ww8fY3dO6oB7iw299+WB9Uf7WZLuxGdmHYawNxGJBCankEqZB6mm6Pg+7TV5iWPxwP1aYXoAMJi
 MXpThnPqR649IK7QcXRNUYuw6PiIMjc02SJ6KvC8UdhsppqFvMwxjvt52+hjFRWIUC11NzGLln6
 YmzwEEUBhcwSAN4YQCjRhZeGs8Pmu0MwY1Oj269YCXhCMTNSZ/4bEU9uUVXXWAPBAAhFSsrPP8y
 dTbqURJ9+Y1c4cy8JvwQVDm4P6Pb0tN1QBSgnbIZLiFNJQ0ueotPvAGLiSwwe5wb3ojn5oAMu57
 8cj5qte0LROY6R/2pWim0uiI17A/m4pERPD7VtHgmUDbxJx5E7x1HuT1i4ajcaq5rLyF4/uEXnX
 t+7cb3wTQUvva43F8nb+7gz+jraQSNDhscRkDj1Tk1rEUGgn1O1voxd9k6uTTiqqKt3Qru9aXbD
 LBGS8/MxI5yk/IQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: JFqKbvvc6kO9WUBbOXnJSntct9ff-eng
X-Proofpoint-GUID: JFqKbvvc6kO9WUBbOXnJSntct9ff-eng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX0ywB6FGCH3yF
 hBVfO/Ccmz6y0uZf3zBa3QQmwDrbp+UsENfyPKFKvx50Ji72nMlLtrC1YcZKm/Dm1T0dHE+Q4se
 UHyrLgVdgleyKKaw83t2QT30ToguNb9MAYHbSj6HbpeXCqzuTsBRd8D3TuNuhI6kjC+SdoXjx0+
 aEd/M5AHXVPng8PwmQuzrZ869sW5q3cBuGr/UgvKFtb9kisuYcGLiuKGJd5MqtDAl57KrC/eg7g
 DVaAlEPPU+hw4PKPCvR5qC2HW5UkXLWXHUiXDVDfDLU9kzyDvAVlvx+RghWPPhoNVgdclW9e4/3
 6lXO4i/NaQOXZk0M2Ku0CqyPyWdec+e1WKHt0ySobyZjvoXIuSCj7md2t7YQHdjS5HUHDMsUE61
 RLlZGMEDz8B0+N8EYWZCsKzRsJZ9S6fqHA2yBHndG438MlvUaQPhhXf/7ZzRY25V1I2vsmLmVD6
 Lqsj5Riy1g1h5BOyx3g==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004140 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=lR0QwHyGZrhmQDu0ocIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX4eYYBZ/aUqEX
 VEqqcxGxAPhrYPCDiP6lvu+/T6hOMW+8PCtgSdkFND1VEl6k/MBaIT9MX+eq/yPxVvI3qCDF2da
 nEZBHNWMzdZNZaMdDNTCGT+3rlijTcY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

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

