Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178837;
	b=Nf+S5RuRZIUKFEJpQzLMRkH1KkhgRQI4dCTEV8bGISdRJqWyePP+Kk434nFCKyXeCqvv
	 d6pWP81xg6iVjCL08AyF+PLfONWDttGZ68XUu7HVmhjLtDBj6FaOKnZEH0RbS9Zy6oizB
	 a2lQ07+F+y4hRxHVFgCyliyR1+WxrIwRWnGcfvj02hng6zGQ+BFBFDFh8oj+SXQbBiXpm
	 9edytzWiNiFcmMcHPLzCOr5upa6L9kK2PqMQeAPdHvoJY468/ZLKy2ZmqkGcB+xEN4laf
	 HVk2ADk9nBOZrmW96++5LvDLttII/nJCcUUj3LBWX+Rodi2J9dANOUetlaKS1VoTI2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=;
	b=kalXmslgp/n0wIi2dym85xiibBLKsr5Vzv/9TtUzUUbqmlArSMOSwXEJSDKh/SHixeu8
	 Lo5ECOHB2yzv27lxz3Q+WlRa/X3Fo3QivDCub09VZx9vq+3pUqJW91SK93av7PaItDprh
	 /vdSz9y57fvlc2EOzeevmqLOeH5AcDbY//w5mhhpgs0IBJWrBH6g+2YFUUWJ/fOXyblMJ
	 /YGU0os+8IADnqQ7AXvSkpgThcYd7vTJ7XaFPc+s9z9+xlx8yYMgQusanAOWsDpLdLr4C
	 4G9be4pHDyo16bCzXUfJCp30C1DaEORswVUdvyAH8l9Tw88zZFR01B+KQStRzA/kRmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRZVYadQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UiJ2rWbA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0A860A5BFC
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0A860A5BFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oRZVYadQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UiJ2rWbA
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjtD71528508
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=; b=oRZVYadQvCYWx+Q6
	Y2FThl0ba8JhSx7ZZ01sfsZ15h0Z5wT1EcyXAp7GAgEGAx9eRti+oc5Oqlcm+xto
	zajaeD1uOMFymuGWBRC/C1Oe7x4Gq465BUxjtsGFfF2tn1ZIw3rwoyF1OaMJD/24
	zeW0jgAVRzLmoHn0Y05pFlhEcdn/IgIZiPk6pLHQSyUTLNTQJI19Q4kSTS4qWxvB
	rC9Y6xOz5XT5Uvpp0k0+/5wayztUdGnKX0HdSuBM15gBUI7rRSraJrP+ZfWAM8P4
	kVo9hLo4o3T/j0LgUDtonVYTnrQrs6OpFYk1+SD2O7CkVyytegXedpcAlDSMKKy0
	iL+cgg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2fjtsvw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:47:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960bd17b5so156499985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178835; x=1795783635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=;
        b=UiJ2rWbA9l5L1Ar0gbWRDFhQMr89/+wYL+8a5o3Cp9ZBpFFI71e/AupmpM+fR2sjed
         ULIJfRQ1FOyWe7FLa0Hs3QDvbfYCWHG+zmrG1bZAwxwl6ut97J5sUPMlniMtVuSae068
         HZ8CchgMWOPTwCYWFmusL/a90eO6KtFTqc51an1bUqmSLRSls79HbVZ5KNFV2kivXLh2
         Hw5c/diNSekHiMDnR5/v/BHW6Gfu8/mEb6N46B5kBnveYQS4MLR+Y8tkqCDJTkdOG1v0
         KZzTUSxrKRzfPYT2hCASnSWdg+06yHMY3npsckFVnTrkyDp1tRjnoYQ12/BHmEHZR9vL
         Yibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178835; x=1795783635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZYge9rMri5rOho4JnKSUT893vQR9YUEUOAWAOacrx48=;
        b=EmtG9UT/mGEtNYskiE8Bnm6E66aWlfHThGBqYxWtG+EYBZE1k2S8givDaHphZLNPMu
         TQRR/zTZs94s7jMc+ugy/Zjx6FV0xGhPpl2oDTihtTmWPYrlVs7Xjs23iSHIUE7nj62r
         ZX0bTolAAEmM9N5N9luszohgEhNGSmff6Au9wP1jD1E3uIEXHz3Z3jf3iU/n58jQwnTf
         rxrZI7u8m4jaSnQuj27H3TyQG8PTYvh6aQO0qU2/2ilfh8tm2+1hXZQVxOR/CR0bxIRb
         RPJ6XCA4q7UBEEJqalNv4YTOn8NOTTbkqxEySb7pjQYePrS3BqFOz0qFn/nq/DYrQeOt
         d88Q==
X-Forwarded-Encrypted: i=1; AL+hErElnxNzLuVA/ikEczT0gOdDqk8uxUOGCuydJXLsC3HjQkhAhBbQSHMn+ANFF+iai4+665ERmYtHXvsjac8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1KMAYQ/8rCZs4jJlCYTvPl/mN79uot+JuNMbX2fgKJJEKnVcK
	7Gf5L7AIEUSmXdbxMoMcywIK4bhZ8Sdhn5d54NS4yQvGgTwG5dzSdvDKFpBclGMF9wK9U3yY63B
	ICSMKsq0CzKLIsz5VjrvbH2mYXK52JzQ4GPFTSc7jCjMlK/hR4svQvTF8bCAL7Z88kVI=
X-Gm-Gg: AYBFou2hJwWtsCBvC5bZ06k7IFGIJxtGVwXrLjQ/Fx3OYLigVyXIHKD5jOaacjF+iaF
	+K+Ms/sRyQxfpF4zj2gLpTs41b+b0eISowWK3kwIH5ZzrogE/oZTadzwRt3daegPrL7SZzz1HSq
	2CKkaLsDPuNj6AbA9AlHxy4tyFi73iGqfSUPIDo6fSobCAGphBME7QjitmPMBmJzk5x5efcj6Z1
	Pi+8ITZrnvRh6UHdBYC8nCp86ATTVwMbgZzNchKYPfriHklC8MEMPyc2msQB5ZREm+P0g1PH3P4
	xriIUudaq5aBxp9/OVJ9wG9d3tc9/Rpr4WJT6HdqJDtJJ2xld5RpA9tJx9aBNqVsfXnUwM6W8H6
	hy3Nl8FfTkzbgRS1UY6/z8Pz+lV+BjMe6QTxOZ9paMYHQrrJ139n4jdv5ouPo7JmM1QBGbmN3qC
	I=
X-Received: by 2002:a05:620a:44c2:b0:93e:920c:c00e with SMTP id af79cd13be357-949ba95e5b6mr485702685a.21.1795178835187;
        Fri, 20 Nov 2026 04:47:15 -0800 (PST)
X-Received: by 2002:a05:620a:44c2:b0:93e:920c:c00e with SMTP id af79cd13be357-949ba95e5b6mr485697685a.21.1795178834684;
        Fri, 20 Nov 2026 04:47:14 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm119248995e9.11.2026.11.20.04.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:47:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 13:46:46 +0100
Subject: [PATCH v3 09/10] gpio: shared: remove unused field from struct
 gpio_shared_entry
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
Message-Id: <20261120-fwnode-for-each-prop-v3-9-808e304dc73e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1175;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LlJfTzXZqPhPYiFBMDDbJUjl6+Z2YhN3yTlXo0CvUjo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAEE4fvRJL+ZveX5BmMRTVI0xMZXr6Ij03Kqcz
 jdiUFtIQN+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawBBOAAKCRAFnS7L/zaE
 w6TaD/9Scfa0Lmv3m8Q4KKZfDFfFDgXcmFCrRT3z4OcdVe8A+4n8W/PM7KmtlLSNvizw33X9lbk
 mW/EaCE5U96E/gUBeaJahtpbIA06luLpOEFoJbJfBvfVjUf8bnfdqxobohQPdIH/q7bvW2mctJo
 LrjxB4o0+fyOYN/Gg10IsxUdPRIZ9sJamZKv7FEjpp1pAf0nXqcxkgHKr9GbRdoF9X/BRGqpdWa
 7hANJwMpl0EWcrnNXtLmuCGMRkNMaLMMAN53S2dd1jj32u1f2/od0+6wDeaQSo+92qT8Kuhqcsb
 IGFYcjC5vmM5QpEYJXYLJTrC2LmyTMD8DR9u2uMLAKRzLsIzoGJTERPugK5GXLwlKxy9C/1cbaL
 z0FEBUgnCNNwvpx7kKOPrrjx9qFZxitecrMayh0j6zjvdCjA708U4+g2Q4vSFirHZW9cV9ZAyN6
 Mc5TQJIk7SssKkq/WqApM71Qxai10+7XrESJqpuo1+SgpbrOFQKt9Hm+v5mkbTpiNOJEYYJyw5W
 bNM+gNibRYcy5Yn/xByAholEFTCaUM2wW4B5ALp77np0orZoIM1+IpHNHgowTnvPoIJ9Jsx4mGU
 cGVDNZ7ME3DcWYzrDdY6G00mCyHww+XJXkAX9lELkyhz+9YAU9z583D1exdDcNZ1gNXZ4OwX/kS
 XykOGXolGEzkWbQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: IPV0PEkq6J7mPaFlwaPNKusCJhXtlLj9
X-Proofpoint-GUID: IPV0PEkq6J7mPaFlwaPNKusCJhXtlLj9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX6wLc1uloV2+N
 kPSBXM97Dh5aHSw3PNyZpRdH2zxZ8KMnZvRubHuvagcafXAIQRTYRaNq4FjyD6gPqcoEGcP+OX9
 DzhapWQGL93aynIxxqs0csRANmwWjK+DGCBxKJgTzJZ4P6O+6BCWP1ph5RZ9CzKJxl4JB08NSPU
 AIzsAEuRUxvGxse7wXf9d+S0XYx90D3KwAeTW8BWshlNtCwkx2xDF4jWCEBt1q5NOYiRZzzziWB
 Q6mwf4Paqy1c3HYKtSwOBUQARVPS0mXBsGG9H9TR7gs7qgpPJjywCLv1jQgT+9bqIerKq2ac8De
 Gi6lam/bimcZ1mHi1UuqZyMOc1++PXQcUSwrFjT1+9MtynkB5L13Ziuk/6ZlkB2a3MsyloAOd3t
 qFgAhOwz53OVVaMuf8t0gOjnoXq97VSAq866Y8/VWjDPNu0jQ56ua5yGpjBMQ2JloRBb0SE+K1I
 316tA1gXp4Wrjm4UlkA==
X-Authority-Analysis: v=2.4 cv=XcccX455 c=1 sm=1 tr=0 ts=6b004153 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=AZKRSRgWbs_cT9JdyuIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX9+/gvJWqwgN5
 Ycd9C8GtPhNi9dpUtnpwfyPtIjbNXo+OcLamh/jwn3s7lsF951xzdKZ1qOPOjdAsGq9JPEmHadI
 hNE3ymFPo+aOtEMnclQN5olZHRHYz0M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050

The index field in struct gpio_shared_entry is an unused leftover.
Remove it.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index f0e3edf07cf1a677a58022f8d76cdd6babf1c655..fbabc1ee489f881084033f7b92b42397455f5811 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -50,8 +50,6 @@ struct gpio_shared_entry {
 	struct fwnode_handle *fwnode;
 	/* Hardware offset of the GPIO within its chip. */
 	unsigned int offset;
-	/* Index in the property value array. */
-	size_t index;
 	/* Synchronizes the modification of shared_desc and offset. */
 	struct mutex lock;
 	struct gpio_shared_desc *shared_desc;
@@ -228,7 +226,6 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 
 				entry->fwnode = fwnode_handle_get(fwnode);
 				entry->offset = offset;
-				entry->index = count;
 				INIT_LIST_HEAD(&entry->refs);
 				mutex_init(&entry->lock);
 

-- 
2.47.3

