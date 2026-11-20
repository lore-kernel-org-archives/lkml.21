Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178833;
	b=L7z7gFNrRUddfOYdZuVKZvWWjrBSUNXdKPPQ5LzyGGOf+O4uyFxCZnSB4YK+spz7i2LC
	 x3i1EiBsNxjAnSNEscFeF2yI8kHtmPjF7/vpPkFRMnKqgQ40j3aAc8dUHC22rpy/rUZdu
	 wpyAQttzi6d9xg409NjEu5PQ8oF2GeQIesTmkEfyvCycGwyIekm806v9VFvAnvRnyQhyt
	 UZFUXj+yazA7DWq250PQJcvmL50E7T4PTTT+PPYZBXOMlCJbsxXx/UMMKJwlAnXGo6RZ4
	 JQTRhhveSFnaV5Tj5PjGwXG3jbzZImYezE0kUb8OU70vUkUtkGQRORq1cp01v6Qrkxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=;
	b=AjzX9g102HGGqzsYKCyFxNJpAKh1jPUhf/Z01APNkVABaEzbflzbvb1VCbO+a72L95lX
	 hMfw/DjloMPIfmpp5i9LYhDHPSv0u55d7o0yqzEsSSIAvkm8czYPb1fpFp96oIeABXy+9
	 RgTzmRQgYtM2b15DePCsK0dF8WgzzkLtB82fmDs9vX2Z1yu71eW5FPS2lom80VuB3SwWe
	 3IJdbJ5DpxwChs/N80NpKt1Jmc3pXWiL7C9yqzru3q8mYPpgG7hDpPrmB7HDUOONKgas/
	 veINVSC1WqjQIl0kPeV4c0HzUkBZiSL3Io4gty8N15jPkJWf5MTeOGd+sX/f2YSnsBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MUBocEv4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FhMXk/D5";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A3560A2630
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4A3560A2630
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MUBocEv4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FhMXk/D5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAkg5b3107621
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=; b=MUBocEv4E/7jRINK
	QIZk4Sgze3Qr2qirj2/AJqQKX7wPOTH8/nfyhhCRHr6v2faY0tbDpwTA+rC4To7X
	A2B8JYIqWECv+Dz9zDBKTNOhyCO75fnFue5l2Jbpn7LumSWzK0a1f7ST0bhdl/rY
	rfxvVn0cZmJ+rILRQVyBG62FrD3lH3WFxMRfBs9cdpRUBqL21oA7NaPFLxBxo4NL
	WcutIbkd7j6zZcZiqdpm7uWNHvua3DCKVoZhEmKCpplfs26bp5y/Jd37eSREgcOC
	QfQC1I2i8Ch0FfXDl9iRxJcOwYVkPDQCVppS3tDUnhoMFJ4Tkr2Mq2oePvGnO3nc
	1Bk4nA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au3rcb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f5844e383so156624585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178831; x=1795783631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=;
        b=FhMXk/D5VaP4aUVXq7/irKiWOQnF283HA2IuGWQtn6WJnrVBn8ZQNMXLixEjXcjI5x
         5JWkZdD4pM8VzuVLb1L3X41vUVoCLzmOfHqnpYUhxyo+7ynwyF7bDncMfZu++YbWad3S
         GsI/XBFpwGWQTY4pycWFO272/eo+/qNsJqVmo2xqsNAjHsiTwkmuKTRtG9/aRyPPWLI5
         olBPMU0Ah5z4fEzbtV0NYXTPlyubY3Ubs5TNAyZrttT5Si5je121oMA7RN6zcSs2y8BA
         7XYaIaP961vRX9Q1bntiIbiNt5V+wXkibZ6phv55Wq+I/AWMDEGsadpRjGmaYyxxSAw5
         aLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178831; x=1795783631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/aAsP0tWsYUKW0MBNVosDOUf3N/w5cc7B/jroRraKSc=;
        b=GzkiscPnYNhmnnhDT7+ZdI381OgOnLwtzr98hqTGWF84A/7IGcY13uicpbICt8l6SY
         SeILT+ahZl/Y5x+HubmGd/stiAPqN8NLAU/xLZlYDQzA69Ch5dpvihJuLRp/2lmcaSfs
         nJk2HREkKwLgUJZbLiB5oRynHjXnUOpYB0/6tce2timtW3kbpjYW4e9yKAOkmoqNX5DQ
         3l0aeFY+/x1jtWNLwwP2nwIjHxYPM/hDoNwALTZJT/ljctaSfkGwOuig4CAoBUvwSCpd
         FXTyOuDrxWVD9+yA3whJV8DJOOxyxHTm8MIUlooHoxouZqWV1jqa7nKQXyIhR2dqKpRE
         dnQw==
X-Forwarded-Encrypted: i=1; AL+hErGPePgO7kle/AZ2FgCj8MjJHvmlHM1bBTfJ9bblUXIfCobUpu3CHyodOZK0Umr4OuPcHCd3P2jwke9tXJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kx371OO0FijHZsrBsoE60S43jkBaVmbuqJFq1mV3YkmyTqrft
	Xrb7EhF/avmNPl6miJ4yJtyBGuonw6KBo8WClllWBvBt4qsgzpRGLfZxgSv2RPGljoy1Kv8ARz8
	dnqu4R0lKBQI2Ef7ZDgOWlnrwxYAoeym+x7JwxOFwQ5yG6OusQMqSbsaph3R9P+EK+ds=
X-Gm-Gg: AYBFou3cH0H8ImwsK7ykV01W9bZyl9f6QlybxszCfzi3q/pZ16TtSsph1+3ZjhJbT37
	DMH1p5gfm9YT1aflaonO94xmOIod46ob8IONt89tQucyJ/K5Y08GTQraJJBR8k1yRm8q8gTOLEk
	nNuvfbt6bA1P/D3DyQ/NtGkPrlvbg/v56ZtGCyQGKCO/rq1OBKjHJIMc/45T4IllNGaGzmeKC5s
	4rczLKUOJY0NXBZ25IZZVvCrbVwtul2NPRqREe9E2jekq8JjCcJb7FeyFkg4sp186E0Ydko0w7r
	2vBi5hdzu/pRVLDQxmwI5K6g1vdxSYUkvgszbRHiqI8bjLR0/Q54r8qVToQErkJ0n5xd2Zp8KPS
	9QkXvWAGXS0BtFmPk5Jqms4DpuFd7iLn0WpkN1oLnxVJObyjRxdBdDwE5Mqb3uq7srKkzqBK8Jj
	o=
X-Received: by 2002:a05:620a:44c4:b0:949:68b6:db42 with SMTP id af79cd13be357-949ba966a29mr484803785a.23.1795178830770;
        Fri, 20 Nov 2026 04:47:10 -0800 (PST)
X-Received: by 2002:a05:620a:44c4:b0:949:68b6:db42 with SMTP id af79cd13be357-949ba966a29mr484798785a.23.1795178830301;
        Fri, 20 Nov 2026 04:47:10 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:44 +0100
Subject: [PATCH v3 07/10] device property: provide
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
Message-Id: <20261120-fwnode-for-each-prop-v3-7-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mWA2E75AM7RdS21w8SMPhz1qTA6x/LrBIO16v2e7+rY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE4ZAo/nOl+iU62w++VBFBMyqgdSVYKRv3f6
 Tt38CrQJd6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBOAAKCRAFnS7L/zaE
 wxE8D/wMuNybnHmGb8xWJOLJRHEONS4yFDXaiIPlWawO+BBxnZRXNkgaSnGyvyvCX2Uq/9z/1e0
 miLnIvmr2T/YtY0oxkANUh3qZ8w1rWk2lLme/8WHS0Vg8iM4KWz2qvHzBRS5drLcet+LuBxuLZt
 S1GR2hXHy2tcSbHFpYAC7s89XZ+YproocHxwLdADSn/I8d0uH71PBO7krdfKnMD0NpxyVni0dBb
 CUAyT6iqG5gEhzpjz4s+QK7w+Fwhi9b+Br7hy1mQRzFOpcHP1V7d6NBaPWpsnMg7IoxYD1H7T82
 d6Y4wHYPc9uSXnULYhGRdV3ELQcz2kWyXvsX47qE49LOQO4Lgh1RtvZVLH62xDGaRu/LP9tSF4H
 NYbRkCEDL0fDH2Axrzb3oVSqQvDbKeeBVu3XVJZXMLzgM3T6TtIgDafMYotmLI4cexrcJJ/ONnu
 mk3+s8rsVm9eYf0u9+0PsBLuEodvKgyWIPsB26ytv9cEuSrSGtzkhRX+a2GMu+IV379LlCqVkOr
 C/pKSmHFlEEuh+sfZaBdKx+DqDhmEdvbC1CNf8GIYXWWqvVktqkhWBr4yFGbkZ8ub9fN1RfuKw3
 /4Wn4Jec4i7wZYMcqwDo1OeKo4QqsTWNwPZd6RnWuguho8qp1C/JcC7gKSsTP4UB8wNFeqVHaze
 iH1f/31yyxGN3zA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX8dH9Fy7bwH+c
 ZXG71A0eDjGm1KmJZ4pBjCb6PL/+VYLXlf44uGHPVg9aS76ZPuVwUv3VLa5SygEKsa2mg3vVujA
 9oChVDiW/kPlv/jJ1Qzrd0bj+/elzFHv6Agno5cCt/LjcHcDwSM/pXYvLK61G6Zf54XJ8YvtW4D
 MR44WyZyrNLqj+38LbCTg66XTzlLPx0+tdm1GRhB8dj403QPJ3AdTl3g/S7owlmnSoppgM6lL7W
 NUC2c+qnyU0ZzMXVgVh09nlWFc/GXpl5gmc9MqQCkjF6J9YX+9JCAhwzNX3Ve4jIBNlG0qo20+e
 RFXlScVM9enJapN+h8Vo0Oezl6YHrCq0JbQAcRTcXZJTjq0KNGNsmDS6+VFIaEugoxvjL9oMtZU
 5al49AYNGosbrrC/6iTZGIHD/fav/sBrIwCdKMQrNDGEKMbCo9egMXmaUkTW82C6Y4WlMqWLLFv
 ar7e0Uha/izayUrW4bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX5nRNvtAGugyi
 ruKPojkx+s1knze6rseRZOc6d11GXK4aQ1/QS1NwZlGGS9oVS9KfzPc0UVs/h5RjP96GywwJT7p
 kN4pFDGTVq4gRTyiOMensfiwzxE5yNs=
X-Proofpoint-ORIG-GUID: htM9_lgJV9tsByoR9jZOoE8EeRtjde8d
X-Proofpoint-GUID: htM9_lgJV9tsByoR9jZOoE8EeRtjde8d
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b00414f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SSMJkwzw4Xnz0fcc0q0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050

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

