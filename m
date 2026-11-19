Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085867;
	b=MC47MDo5wzDDk6sMXB1chgYwJcpnvCrtpwHxsIfeJMYqUR8gUntTC+iOKyysX99Bj+In
	 f/+/lu8Up52nPrU5xO3eM8sa0ee/7NMXep7uuOaFP7hXJ7Bb01PzIvb6rFByV7Bl1YVK2
	 5QEBXZn7dtQPcsWlvqPjZKTyC1WpESzVvgiHXcbnN10cH52uQt6ViL5n26RrUn7LDz6Ew
	 9FuPiYmUQ7CouDa47tD3VA+vr4l75L3/FownWfci9rKlZa5l+3yA3Yiaa/EYMew7TERpP
	 Ecf5/ScR95Ntt8pCBtzcxzT7GUQ+GHoiRABVobMHwY4KOVlenQlzGtR9mywxZ/xz/3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JFsoS6ri2XuI0W7ZaUYiJaCSvYPtS8y6PfumWrPYH1U=;
	b=RKBQxNJiYl3ADlxvkNm284oISy9MZW69GJo0jsEFZdz/tLPVyvYeeX7lIe872qP7o0bv
	 uK/0dqWWiLbaeiGkxSF3mHzBiJloZpPto5ikZPQ0ZZ/7zJe0XOL7Dua+E1bkOrKeaD/dU
	 cJ4XamYmc4m/MrY/NS3KD+qaxM0VGK/LNor07VLlTtpeRjF6OSUneqx7sniOfkEkJAxqZ
	 MyRG5UY9vNGAFHw9Fyy9UK4SZ8u47uZ2a6bwM6icR+DcgOAebgN0QEPwaofgleF1+xi2s
	 PPq4zOVnlRFTKj8ZuPLK9hJfAtsaOJiEKA4EM+bUxFehsHKlvbYSlZMD9i0vN98rUzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3LbohtG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vq17G138;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534FF606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 534FF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3LbohtG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vq17G138
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAvk2c4173585
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JFsoS6ri2XuI0W7ZaUYiJa
	CSvYPtS8y6PfumWrPYH1U=; b=O3LbohtG906Q1T6XY5bwTkoSh4SJNCJGUfJg4j
	Ois3DCtMUnTLp/e1+H6CBP39fWS0L537A3X2vR+B5Yx0VSaMl1vHzL5GCen8OoBE
	XnRtuqY9LKrXC8S9PiqwiXxhph6Fpu6wov2t7ZxFTcwgODG8Ybz+qQuVxc4K4eH0
	W2dg9v3OFNF5UtbjF5wia71rk4q/MeI5Zqd1b69rvqBK51Oe5NUKQ/Ro7Y1DINj2
	mrV6yNb/WWXfmPDuErOroLipl3K1Bb4V2T8gonem1yKKRTzgdnxn9F2NVVzqfOOl
	Z56Thi9rveYngsZwKdzCnvW8/Y35Dk/5+0cfPA0eZnjaMGQg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2rwcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:57:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-542fc619afaso27299581cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795085845; x=1795690645; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JFsoS6ri2XuI0W7ZaUYiJaCSvYPtS8y6PfumWrPYH1U=;
        b=Vq17G138QbTdXc2DPGuuEO+Tq8XYBQ5NwnsQfe/wDx8za/ztOYRO6MIxHcCnPsJwMa
         DjzW1EK4/nXeIXOBK4W5/1wR+Y2rkAH7YxM7bjkS6yWt6MBDF5wdXc6yD7S6wM/FlPOE
         sitCI98IreUIIgzTBuplG+YJ/mF8Hm/pCCkYXe1O6qeCbrtZkawXUqaoAi7DuJajf1Ir
         NnD7xAGThA/4gCcDmAIsHzFn/mkJjhxAmhJN+fcZr+rKH7Co/2Q/Ia8BqWGBxxHW71jo
         1LYE1aAhQs53sOssLNtlr3ChIsFznoYO/lQiolabof/iodkxWJR9tohe6X0fnaU2RbtU
         Dzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085845; x=1795690645;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JFsoS6ri2XuI0W7ZaUYiJaCSvYPtS8y6PfumWrPYH1U=;
        b=GWEbXHCJoky/UqpWcCdCviGTg1jbGJ2W+J7FcHSDlQlBmhfuwRYltOMV+qThwM3Xj8
         ZBSSEbCKsVUNLjf/PyfWFT6lPHTGm+VUBn/dbUM60E5sBepPNn2ORwg/uGgItJjPg1LK
         Xn26w4BhfsWhZdMwil1bNXGic3OgZB57XQ/53Ktw37DkIvZdU/Xgc6ppy5F5Tf8Tpb6F
         xXNHVDVPnz2LF3EgRARWw9V1ChUKJw+Q9yzFURrDKr08BGrB3XrQHiBjWX50HToPx5uW
         ICxQRRKU8SiCeZOunH+a1Or+zbXQJ/ddV5I1u/U8Qjt2wj9HTtsaihQsIPd2xYdxjnD0
         5iGA==
X-Forwarded-Encrypted: i=1; AL+hErHxkCCnnG5EJCNwKEfkl/uVS1JSgYLl6vc8dP0WWm/mVbsjl/qjD+a8e30mb429uvAw1DdqdPUwi2xefS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/unC5qa2peY7IYUel1EASvuxTUh9tdLb4H7dG4grOqSoosXckz
	18GPAP1PCagByOVk+H2Q01e8GzsyrTaJ9b80irF6xUjO0Jl0T5F6I2Ooxb9yurY4tR8/aqTvgit
	lXF5fwRJ1jGz4KLVOlD8+NpA27jm6nVkkzvCHJEDwD4ct4fI8ik2X6xatvQbapBSbK/M=
X-Gm-Gg: AYBFou1tQzaQxALa4U7qZFWMvB1MC9Hon80TsC70aSReZIPlWhM0x6jnenZKcNyZ+Iz
	GJJvuBZIwDjfWmm19e3ZHYfNFyYgTNq7M/mf+KViKe+OGJn1uC+3cKp88Qf/c2LNWrjpHFN7Ktk
	ilZfYoCbYJuEyva3KGM8RRH+TUZAebGmyubLswADMnnpOrsd3CO4moiOBgms1C+s44FrN4ZsP3Z
	3m76RUnFQ7MUHLzxSV3Hw9Qq5BYw1hkCJFr5CXY3BszICYUIaUg48PzEvrIkzscxvOxEtixyXnj
	2mhbzehFoyD5K0z+2C4HM+upJsb7Vod9kMi5NKnM9lsDnfE0a+k7n1iltW+fWXVZsi6vy0QCyyA
	OF7grmKkqZB6gkvoUgp3JcswEY0gNDXEkFazNow6HrLl7qBUnnOm9DNzLA8rHQw7J0sQLwxjjsc
	I=
X-Received: by 2002:a05:622a:5807:b0:55d:333a:9c52 with SMTP id d75a77b69052e-55d5a2b12a5mr80194301cf.11.1795085845212;
        Thu, 19 Nov 2026 02:57:25 -0800 (PST)
X-Received: by 2002:a05:622a:5807:b0:55d:333a:9c52 with SMTP id d75a77b69052e-55d5a2b12a5mr80194191cf.11.1795085844584;
        Thu, 19 Nov 2026 02:57:24 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e4df2bsm26665535e9.3.2026.11.19.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:57:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 11:57:19 +0100
Subject: [PATCH v2] software node: make swnodes hold their own references
 on parents
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
Message-Id: <20261119-swnode-kobject-parent-ref-v2-1-7ff8bd54e526@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA7W/moC/42NQQ6CMBBFr0Jm7RBaIg2uvIdh0dJRqtJip6KGc
 HcrJ3Dzk/eT//4CTNERw6FYINLs2AWfQe4K6AftL4TOZgZZyUaIqkF++WAJb8FcqU846Ug+YaQ
 z1sa2pjVqr8lA3k+5dO/NfeoyD45TiJ/taha/9h/rLFCgUtZYJUVtbXUMzOXjqe99GMcyB3Tru
 n4B1Ax5mckAAAA=
X-Change-ID: 20261106-swnode-kobject-parent-ref-3bd9b9b75aeb
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2423;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wZe7rBsEI4ji+EJjGj+EZVL4FRQLMyYUnyMYDZz0BmM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/tYRI3vkUlqOQ1k9CeKdLjYjbWcHJvtmK3x96
 OyNwDhzW3qJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCav7WEQAKCRAFnS7L/zaE
 w/2DD/99v6wV46jHPGJgxjVou9/QkG40Ryp+Fb8aKw6uG0dqNm4gzwPlZWqMN6idOAdQM+xCPhG
 gQEZK6cJs6YnEwSZbU574yuNIfD2Tgk4u9l4H0gO2tipG8oDvL0O6TpEs+hE2R3GmkjBH/Fe9mE
 +Rcegf+zqhuk3YJGO81VVfP0h76Xm6nmgZH5lx50gG5pcT9FDz5gTpXI01gd4BS/6CJEBBiJqZK
 fF0MvkWMumQVtvGhedfUDyAd2u5hBQfI2xHGkl/dvAfgN4XMTVWKvlA/1fBe/liebDOJvjM8Zsw
 r2hq6T25qCi9gIOi+lQSMv3/5hi5Dm9SerI37ptoqEfCMRfSkVXrZLSbOF1vBxISVWiplY1Wq7H
 thZHPBOqnEA5tw9gA3640PyZj9Jw2co/DMUlHojp4z6vSUVjW5sT7FzTWtQjCQYWaIQBqb4Me+t
 5002OP5sfpW6kipcIN/KbWtEfZdGeY3QsT04UDWGjOqbzLecw3b8/NhpO2xCH921HvyugFLtdcz
 qArcj0bW0mYP3t4mFxNMTYQBsFvPI2oxfbwDsJa6eLq+GiFnhyUMIIlU+r0wxDRi1FSdU3uijhS
 kVeV8RyVnEGVTTQ3V2/plyI6XNzBJYDHm0iKSZPq+NqwQz2NPyMSOdBylO5BxFwbcY6mhqahLNY
 ZDdWkt0kor9Oncw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Wu-MGBujGxJSoN7QsrSq2vbuMKMtK0jY
X-Proofpoint-ORIG-GUID: Wu-MGBujGxJSoN7QsrSq2vbuMKMtK0jY
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afed629 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=gm3xcvSgROcOYQEXUbwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MyBTYWx0ZWRfX/aVzYgCRxCau
 xnIkImops4mrE+j2J917QqPh5uyVpe7ASNR6e1Zl7YJ/z2HSGNM5TXuUOckPqnr0cBl43ZFHUWi
 5EI7WCYc1bdHuDazf5fKVz2rhwdDbpA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MyBTYWx0ZWRfX/AhTx/5xh9Hs
 bYt8vQaJbl5G7p8NZjccNaQNGFIgFTGxCIrrebReqvR1wUPpJ3jNpmvqfV4RD37AfjYCJjeJuw6
 KnoxMtwo5AZ5q3pIfXclNtLJ/zujBo0hVLRiYUg4dLib1FbNrQq4WCUGCVpMENOn6oQOaJLP2XR
 79zz8vLsDinZgTfanUwOvnnM911zJGaT0PbCza2vArbjwBK00l6l1C9VkkHQ19n6gS+cSL1QyY+
 z/s4MjWLsprPj0KYz/HFBMANKzfvnVJCzbR2n5DyTLLddcmYhL66855LcucwRcBw4a9MTzHPdDw
 Zph1OBvhvMG2XmMaWb/23l8OE4x356ScSb4D/U+jih6PP/Gf0jYCQwKAsyVuYXPR6YaThkb4yu+
 X17Hd5wOrthGq7HD3syb2QGa91p2Lr8yKwkkQIeEq7lD9As2Qi3E4FMJ5EuPTSzLDdED4hk3WgZ
 IH+gJhRL/JVUkHjNasg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190043

In swnode_register(), swnode->parent is assigned before calling
kobject_init_and_add(), which normally acquires a reference on
parent->kobj via kobject_add_internal() that is held until after
software_node_release() completes. However, if kobject_init_and_add()
fails before acquiring the parent reference or drops it on error in
kobject_add_internal(), swnode->kobj holds no reference on parent->kobj
while swnode->parent remains set.

With CONFIG_DEBUG_KOBJECT_RELEASE enabled, the random delay in
kobject_delayed_cleanup() may create a situation where - when
unregistering the child node and then the parent - the parent object
gets released before the child who's left with a dangling pointer.

Acquire a refernce to the parent swnode when registering the child and
drop it on child's release.

Cc: stable@vger.kernel.org
Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")
Closes: https://sashiko.dev/#/bug/linux-82933c14-d212-49f1-bd2f-d4ab1e16fed7
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Simplify the code by folding the swnode_put() call into the existing
  conditional branch
- Link to v1: https://patch.msgid.link/20261106-swnode-kobject-parent-ref-v1-1-77dbd7213dd0@oss.qualcomm.com
---
 drivers/base/swnode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 65e9388af8651f9d9602ff82e1761e5870284f26..f7b53e966b183cec1bfba6535ccdba308b0be68e 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -850,6 +850,7 @@ static void software_node_release(struct kobject *kobj)
 	if (swnode->parent) {
 		ida_free(&swnode->parent->child_ids, swnode->id);
 		list_del(&swnode->entry);
+		swnode_put(swnode->parent);
 	} else {
 		ida_free(&swnode_root_ids, swnode->id);
 	}
@@ -886,7 +887,7 @@ swnode_register(const struct software_node *node, struct swnode *parent,
 
 	swnode->id = ret;
 	swnode->node = node;
-	swnode->parent = parent;
+	swnode->parent = parent ? swnode_get(parent) : NULL;
 	swnode->kobj.kset = swnode_kset;
 	fwnode_init(&swnode->fwnode, &software_node_ops);
 

---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20261106-swnode-kobject-parent-ref-3bd9b9b75aeb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

