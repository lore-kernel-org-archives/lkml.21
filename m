Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685802;
	b=Rx95I71sVEEuIXgMOYy/LnNsf0pnaKxKQznYoL0EvDmo2i5E35vr+5M1nw9kVnSpYi84
	 4nd72Qe8j+c82O1RQ5Q0Gb4BrlqLbvgym5l58BcWaQXW5Ie9kfRODTpPirZ3+OppPY2qY
	 qxtdmASQGT46l+F5zlUJA7vJIQCldOT27tkSYwg55/WRDE8aACnLCwxcU4bFc5YNp9Edj
	 LrYXQHKt+HTCLi2pega0g9RHbGo4aYYBBRvmmksWC0msWetvlu4bJYRk0Gx8DDIOEfhHf
	 0P7Sc3j9+gbeorGGmLleCW0KQUGRLsyERYQqUvOY1NoFCdYpfZalp6u0sHf2RvYuc2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685802;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=;
	b=UzJP1fvQJSKSZJdxvaHg3yIn+KVoc5cy/q1ZXsns23gsoKkzicaCgoQYFPBqYjE9IuDJ
	 0gYyT54cfWSJu0I/PEi5a+38N7ZA5c+OciCoXNEj1jP2i4lJLMHI9MVb3hQ9ZKtOQfsCw
	 AhX7O6BGAJhgblPiLdkxL6d5+k+yYQTLRnw5PbZpOmaKNXdaTO/l7PK+qH7wGo1p6vvIV
	 YBWGIZPebxWDOXSzdU4mRA6qLq3USN9Hio2ewF3p8B+8sliJgeoWgsSygp4VIM7vS0SaA
	 ufL9LT9OX/n6nDwOApMwCS0ZaNdBXP8lYq2m5qjZMGV/pv31PqqMOUhsBe2RwyS81Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnhbKINv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hxG/b0zC";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFA3606A6AC
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FFA3606A6AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GnhbKINv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hxG/b0zC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B2R11682398
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=; b=GnhbKINvZiX4TlRK
	gmSaIjcT0BhI7n9pBjXuUWmNR7MA4/hWlzFRDQPNxvICCoDIbo2VIXGhhYNtrenE
	LLJNDvzP+jFPPtUnPdfrRQzzHSsxxD2rKftRy9cV0H8Bt9T/Td/ez5edQlq/OADm
	3BTbe+d5ERodhu3llah+pIDHbrA1j2Kd3EYpF8KLbzatnnkthTxIpLuYbtpM+9DE
	SQameL8twA5z/tW+Ykn1fXJmOhoWsncKZJzLPGryKdjbTQhn+JmkY+bry20iXoEY
	TMX5mQjB/EuJmdyzO8JEYOlxnOtW3KI+bsKjKqtBUhg/JDbUZeZYJt5Fyu0UsWXW
	6VuYXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aekg4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:36:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844cb60so1148955385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685801; x=1796290601; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=;
        b=hxG/b0zClvSTn6hVKOw60bLmgO061kNfHwAwnaVnNQC0t3fps+ZLK1z75+iR4RX2c9
         1YQtGWJKESi0Pg7x8BspMF8A8MIogElU4zJ+P6TZgeg3hPAoYyAAg4M0Guc6+9cpMXnp
         nF7kXcP8hxFWy7SSq6jfhwGKzYr/5/XAxWk7XiyrdnnefOVeXzJEPh6IxMy8Wyy3h0Dq
         k0tlhkaZsw3CbzEzQ6Y6kDfBFYAe4nLlEblnfzGzdAUTLzmru0r6ngTf0DwHq5m+aeSc
         0mKqGjvg7H5sVEWsoP7kdUsqaJ/pp9I/o2u3NsOwWLbZ3EEogrewyIr0FWVvUT9ndeNS
         sfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685801; x=1796290601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=;
        b=kC2L8D+I8YMRvWmAFTUaWH+rGhZ85BipUhbxi+1sQQOmPW1vRP3Y4QARX3pEOvQwq8
         dRugZcJFfSFmNb3y3JMsjLU12o0yZ4PtlbaugRcB0l8JfTNAuN/oTSgXHGsoNXU+6smt
         itFXI+vDZ8DTqJD5mY6npiCGswieoIakz5pqfv3i+gkHe/qiWpRWJaisEsBkiXvHwde3
         VqF+IjaZJXVmRcBZ0ZYIo3MN2UOuT1SN1Iy25q/wBlne2VeFuPnEXX7torb2sTSm73LT
         aWqasijyfjhI5Sey+UZcj+EjGDj6VIyzQ1F6Z7t+/tanwyt7NcnX60IypNxQJlVLruuT
         WqiQ==
X-Forwarded-Encrypted: i=1; AL+hErFgQM74GZNDqj5OzNEkmQ4cXt3gOn3qPHhMn9nzToPuLZkTCiDLFJha1jS2ApLkrWGwgiDzxtMzmHz8rAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z96xYD7u25Ib9Rxus12C46N8+mUUs8ClVheJcr1vKLCHG/kS1qY
	CCN297trbf8PpGuWMxvE0BebQdQga1UYsm5bXtGlc5dHdCLjNXnLWSdx0a6wSozIlhXnfjKdEOv
	YUn6N1K0MgeKDf3MyJjN2t5i5fd8GVbpIFwRKVDwmuM81FcxY01po2qNjnB4ttBI3MHc=
X-Gm-Gg: AZFdTZcIKW47X32QX4FETpYeF+3Mc0lAgWw4fC/hjJF1TWjgJ4vZvuKJioPEvIOmAOl
	gkq1P0uZ3yoO0veVBih1xaGL4wrp5HkscyI4EB+mY9VWpFbClIM2gdj97gX2OFw1PDE7BALJADv
	/KZfQ9CJnNSEOYEoiKQ1SP1dfdWHKsc7JLT17OgL9Xo3nYBKwk1EQGA0TGfn9peFPWGdYny/1QA
	eoF1JhzvN5qVd5wc/6xA5vsHXcF0uTNCTBtib8myRtIWt+cU867Hzgjahk2m+On4tQzRGAdfXZF
	aARtGAdm24juMvNAjUU66//DqD0RxqCh7v1rvuirAiW/Z3KiZGpSUGWUwo+j2Fnxi9GD7SvfPIn
	AAx23+/N6CKttC9JJlr9SYDwVkL0or3x0WvEf/kdSJtS/OVqdCuFgkoYwr0bVcmXffDlmxzZO+B
	rwuw==
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3819568085a.36.1795685800754;
        Thu, 26 Nov 2026 01:36:40 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3819566085a.36.1795685800315;
        Thu, 26 Nov 2026 01:36:40 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:24 +0100
Subject: [PATCH v4 07/10] device property: provide
 fwnode_property_count_references()
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
Message-Id: <20261126-fwnode-for-each-prop-v4-7-d4b370ecfd52@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mWA2E75AM7RdS21w8SMPhz1qTA6x/LrBIO16v2e7+rY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2UisD347EN/dc8jXfWJ4e2u4IPz1qxiWy/O
 ewolVlXqfqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lAAKCRAFnS7L/zaE
 w1umEACtRjVQioGlR6scZndulJl2TJoBoriH4OQ+SBK4qhH45NDlvAaaMmrJgs1dwORfxX6Z6ng
 YYYbAB4L5GGkjwvFfCSFIlyeMdhliMw+mI0BdPzc/90jUyfIewR3jccpFZTMHw8MUNMtT8HJ8IB
 Aq41FesH8YWIP+CuVoyAAKAEnuLN2SMOiSoU4m0A9C5GgRXcWqc513DQxkBjPc7217qWEExVqi9
 yOrmcp6JK03mrNrnKkEJdRCUOToLhCDosIUw7kQQN3XKjymkGfCXVzugkgBgM9x9PM9P0d161/3
 YOrcPdz4ThIVtS0P2+/cLKDF67L0oAoYQu1G5fX0qEllWqNjnNGTx7TNcPr71g288meQ9OMtqBb
 NFnU4YYJt/m1KQUBmNceFZ8FIuZXnIYsl7cSBu29nKvBb2tzU/qiRehfBSkcvuRJNPjm5YKrd0C
 H8FxsmJsM/gBFf0HPbASAWH8iOHOfnWYhcOQ2v9OHHobqHN6q4uoIg1/HFuCfhhlNuyOCFDHi0/
 +KuNlWqr6kVWkLB5Bf4VGTP69uhk92vGsuVsH2W276GnjHMmnib/SjRQDFIejddiZon7du8ACsi
 5EJ1J9WXntxbLpZJ9BJLZ01ndaqPz0mzHQ7EPTcsapEeuoRVgePUVe1xCpGhoBcy8aPKNhunyLa
 E2mjAPd2EXHk6sw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX5bazIEoD7WWJ
 Uz/JaYJAyD+RSGaw46sz5peNfJ2vtWclb1hoBHKCL9iRHU/BbXn0gYWlgQfwYr4ryC0nPA9HIXn
 qlnDB5VwcU64r2rI9Zj7x5Iryx3HRHzh1Oy/1dkRHDHEzT/yFwI4WAd0+b2ncWVYNZxStg8y2RX
 U1jDtE0Ftzm6MXtBcmSINP0UALbuZteQsF0PTE5prgrKgfXHHTuo519Em5V6HCR5B3+vkGLyy8V
 f7b3PDgHUkH/MYsbS/PBXHhlIlEOixT01nUqjv3oLFLg+7hG9ALVX/Ij3Ys0nJ01oS/r/bqO5UO
 DQyYKxg0GO91YWSLa2EfnbBbVf6lIysuhhs1efvLpNNFLTzw0r5xVJ+g1TmJ8FXtkN8065d6wiX
 mSGHBEOkN10ZAerQPS8008g//6Gz5CXzqPpxtfvHA6ea7h/11Y6zSVCKrJGjOVRfEPOsko1Gyvk
 bUNFfvx6cBrxeFkOoWw==
X-Proofpoint-GUID: -PSzNJ5JdoA8BzGpxdOFR_PQo1gG6uSx
X-Proofpoint-ORIG-GUID: -PSzNJ5JdoA8BzGpxdOFR_PQo1gG6uSx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfX5XdvR2Xx0LKO
 /4kKKCdBGXmTvjQpRQ2h3/z+ROHJPvqsWxIl5tZNDqmjrhJzXXyNFabjJ4el4kzX7ROTlxxOGGF
 ukt5tFsz6d+vSoDlUFTdkaLeNcrDHYI=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b07fda9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=SSMJkwzw4Xnz0fcc0q0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Provide fwnode_property_count_references() - a new fwnode function that
allows callers to retrieve the number of references in given property.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index d3c54c3d11c42ba4aef68687fc27291c7f33beb6..3cbeb147134143cf68af3213ee75c371af363f2e 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -655,6 +655,41 @@ int fwnode_property_match_property_string(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_property_match_property_string);
 
+/**
+ * fwnode_property_count_references() - Count the references in a property
+ * @fwnode:	Firmware node where to look for the property
+ * @prop:	The name of the property
+ * @nargs_prop:	The name of the property telling the number of arguments in the
+ *		referred node. NULL if the references have no arguments.
+ *
+ * Empty references count too, so every index in the range [0, count) can be
+ * passed to fwnode_property_get_reference_args(), which may still fail for
+ * empty entries.
+ *
+ * Return: Number of references on success,
+ *	   %-ENOENT if the property was not found,
+ *	   %-EINVAL on parse error.
+ */
+int fwnode_property_count_references(const struct fwnode_handle *fwnode,
+				     const char *prop, const char *nargs_prop)
+{
+	int ret;
+
+	if (IS_ERR_OR_NULL(fwnode))
+		return -ENOENT;
+
+	ret = fwnode_call_int_op(fwnode, count_references, prop, nargs_prop);
+	if (ret >= 0)
+		return ret;
+
+	if (IS_ERR_OR_NULL(fwnode->secondary))
+		return ret;
+
+	return fwnode_call_int_op(fwnode->secondary, count_references, prop,
+				  nargs_prop);
+}
+EXPORT_SYMBOL_GPL(fwnode_property_count_references);
+
 /**
  * fwnode_property_get_reference_args() - Find a reference with arguments
  * @fwnode:	Firmware node where to look for the reference
diff --git a/include/linux/property.h b/include/linux/property.h
index a70f3c4c087dd85390951da950c3632f89c6cfd1..9f0b9aab5920513cd468572fa96dbe3371609591 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -137,6 +137,9 @@ int device_property_match_property_string(const struct device *dev,
 	return fwnode_property_match_property_string(dev_fwnode(dev), propname, array, n);
 }
 
+int fwnode_property_count_references(const struct fwnode_handle *fwnode,
+				     const char *prop, const char *nargs_prop);
+
 int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 				       const char *prop, const char *nargs_prop,
 				       unsigned int nargs, unsigned int index,

-- 
2.47.3

