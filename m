Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674265;
	b=X+Cs0gt7LkzyzPmjZBICpw2ESwG7+o9dezioHMe4XN5dcEU5PLK4Sod0RgcGyg1RYwhQ
	 XCYC3JxyY3KMol4MTI5h+dQRiNmK6NjF55fFZc+RItryE2VG7XIXWtZjbUwz7PymSQQ/S
	 xpUJw5Db+qv92sOE7hpANRRHabHU9vL9t+w6zNHbEwT+kRgMLwS3oK0a7mxvD9eB4s+Zt
	 XsN9IpblGQomIZ5SeGs6XljJ+890hRxUSwmZQP0py9apFg7+6JQXDCLgesdmuOj0cdbq8
	 /VBiDsAh0pHM/tqDuV3+mlF+JvcPI1BGJAC+g1EQ6NYR+P19gN1HP2ttOmxyu+btIeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674265;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VRWFQMmfOhAdXsj6YFM6m5s/YKM/cmFaiuqWjca59kY=;
	b=Uu5yiudoZU1JJ0aUyzDYGn7gUb8iq+Hg2MAKrlW8/r9vvWQ9lCTg6GBIecmpG3457vRu
	 4XjIAANQ3b/mzm72a23H1ks2qzfurlrtLJfkiuDDafKeurHFKnTePjaf7av5TUvDcnRMp
	 uJUcKWl0843uoMWvHPHzUpxQodaVNvWgPdO9xrKQ523Sb6SB3RtORSPoxdCZgXUwP8JXA
	 PLlYrLNScQSfjJHU21rNzZHregTPWYqv8fN7LitN3UOceItC0UEW1dnIJTXnSJSxk0Yu/
	 GYWjxhTLgxnEflN6DWyoqnG+TTcBKHj+xhNK7x38rNEhN1hGwFOfPwlJcjoHIoa1CWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdolxAgf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fD+zAS98;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EF1606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42EF1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OdolxAgf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fD+zAS98
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36MZ43022905
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VRWFQMmfOhAdXsj6YFM6m5s/YKM/cmFaiuqWjca59kY=; b=OdolxAgfqI2pDZuw
	7lIVRaBaousaXsnNZ+J5PaZizpOz55gw6EmPH8qKWw1Mogj6LTpRSmawjc+FDa4w
	xGb/KApM92k6X1bisxZbLUUwblWajRykzQl9QDwovTGnBYek/nC+5tlDE0uB8QFr
	VltDBQILEM7X0BwghxaLbux1APLBF9b51+7ZPymBtPF3JD66KbXOOfZ2af92J+Ky
	/0Q4xOCGg4WJNrVJYGNj0X5NA9YjU/N4UFPB3092UastC8eGRXFMREH6fxZWHAM2
	p4NQhzQwja3/nr25OdOZnnlL26PD0JJFtzOPSfH95ese/O5gMQdfaWsq0QdtGDED
	OBtP6A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vatjpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:24:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so5263007a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674263; x=1796279063; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRWFQMmfOhAdXsj6YFM6m5s/YKM/cmFaiuqWjca59kY=;
        b=fD+zAS98uZu1mfv1sTxb7hkM9pyfPQHdhSDuKvzli2xMBoO8ZK/TgwppXBB32mNhTz
         qwX0dMGOj6fnRj65WPZTEF9E/6z8v7K0ispSKcuxsfWJqAPK9TzdBixXIJOIArUJFiz0
         lxuCWCM7ety0U8Pmz6dOjqPaTaKxz4q+D5T2yWaQ9vkkASHm+fr4gZ0fQ8Oov+BPZvNk
         RSO5mrHQ2CpXSJppNLMAqL+/dBG5F5NuUKjfn9LXblbfxmW8wZ6rthDXIbFNKnniiSkL
         CrYQZ1ImhCLRAmnbpGJUnTiZBe9ucnDp/cnmu+PzpTVyl3X/MoabfCLyItJh4FlP9SKc
         P6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674263; x=1796279063;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VRWFQMmfOhAdXsj6YFM6m5s/YKM/cmFaiuqWjca59kY=;
        b=mjYp+nqF0AXU+fmY4WsXa5vvCMM9bV78u7jTJzFHG11pLjHbK/7RrJJBC7y/W4yF7G
         XiEQZ7OpXmJUgTAaGz0F9L/H4HZ6+rTWbzkrTMX+072qYSW//XpwuU4q1+U6wTs3IfbX
         SgDyhJH4BG5JXjf3JY1HuCvY8ImvA77o+l88nSzI5Xp8vK/1QUNaqx71qA7Rnf59EkkV
         0aNBs2tzhz91oBdePi706MvSZZ6Mlzc1aIFpy1lInkKnfZyohOhDcusKBcHVep5NOLEG
         ysL4uI4TmZLG9IPrpQVgZaB0zB4Wi+C0v/Wc16LXGTK9Rk0B6Zt//wzpdoTx55bc8dVX
         aeVw==
X-Forwarded-Encrypted: i=1; AL+hErHl/d0+SMGGSKwt8n80JEFssIsURBi6Vr+fbEBIIHE+RvdgUw9MAlQpStn0gdFHeOabLhum74uv/rSyEtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RHCQzPCLcwexnvjO4F/DbikMxxiTn/pqY1AsgJkLC75y/AV+6
	jGu4KugXP/5GaSQhiUrFjTeh2at9vlG20RCkYOisVIxPexZwYolSi+2130BRRYrYbwhW8KZrjtb
	X9SVAIAoCkl/BD7ktDgdTH2f9kgxWbMyDC+YmKUdc4t1C1QgE6L1UufEUfs3dy9anZk8=
X-Gm-Gg: AZFdTZeap2QVyhSKw5L28XfUmdSgIHr3wtjNF+rbF07KbHNAckeWXaEcltfRc8QtBs9
	Fd4brqBs1rfwDFfPBU/ka0aj2Lz2N4fKwrDjdqXf/pU2Hb/t3YavIPjRouKtZX4sohofIowvtv8
	LgKU1TnBpcdutYZIBpDmxOfpnJ1h+ZkBhHYUhvVC2TXMXigIX7cBevARlMVzKohCxdnjOBAJKCI
	xA9+Y9+Ml/PVJ0u5A/AaKh5poY0WVGu++ugQNcSXfiCgzmv8GaFi2GJ0uf/mfyloeujaUHAfRiz
	O67+zusmfEdj0eHIPWhJTjG9fDcElZ20lklbaMnq51cGeiT6Uz1XyWTkT6TtqeRpo5bziH8lPdp
	8qgzxjlOGE5cTXf8I1iuUJbXdUk/S5Nf909eoPvpl/MgBCHPCoSjSySRr1tCZnHCfne5m5IdaIb
	aCeo8+P+7+
X-Received: by 2002:a17:90b:554d:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3b41c9b361fmr19232472a91.65.1795674262862;
        Wed, 25 Nov 2026 22:24:22 -0800 (PST)
X-Received: by 2002:a17:90b:554d:b0:3ad:d29c:5e64 with SMTP id 98e67ed59e1d1-3b41c9b361fmr19232454a91.65.1795674262406;
        Wed, 25 Nov 2026 22:24:22 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fc28asm14988015a91.1.2026.11.25.22.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:22 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:54:00 +0530
Subject: [PATCH 2/3] virtio: Add vendor-specific device ID
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
Message-Id: <20261126-jshekhar-qcom-virtio-dcp-v1-2-7b49bda74916@oss.qualcomm.com>
References: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-qcom-virtio-dcp-v1-0-7b49bda74916@oss.qualcomm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674248; l=1122;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=GarfczuQMc+vTCQFOwF20nMoLmGibGyTdxH8fgzaj4Y=;
 b=xLVT2dFjo27JP30KZLWo89YMNzpxh6pFxM2QaR2byRBSxWn8dA4BXKdb8GXuJjoxbEQrnxjmq
 O96QgrXg7C/B94GfmaYJ7hOthasfXBM8g50jzhTiloiGHkGBoG18Kl4
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXwXizDvxI0fWw
 fpYqLxniXg18vm1/f5DDXS6mtXAPkjGwrTdsTNNXGF5fUegYInWtmg3JD0LW9chISCXWEhnALBZ
 ia1T2Te7+ibw+CokG3uNuQlJbjIOMxI=
X-Proofpoint-ORIG-GUID: DD_o72AgMB01wtbpQZ7z49Qy6kOQtFLx
X-Proofpoint-GUID: DD_o72AgMB01wtbpQZ7z49Qy6kOQtFLx
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b07d097 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Gva-buRrl8eeyeTSwpAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX/CDjBRxM6OaI
 jG1HivYij5nPw8fBjg1wZ4Go7ip1dw3ul3TegORDKU1FIZT4grJ7dNzfiLGQRaZFIfByRfyJOBR
 pRAi7haBnlE04NAmssBx1Y6pqNQiOuWFAX4rXPMpEXQgbUk9IbotctWVLgRnl80A6RL2WHrVH0X
 hKrcCoYTUrJ1bWgi7k/ErWlVouN4f1IfoIN5lpkle17YBR4nCin8FF3xcG9s0xy7YujsXbjYEdu
 6nLgDBQeXf/WDZ36Cb14OxDO2mTm9AaIVVCpieCp6K74HRNs5AzavVYVezlfjdKMkxxz6FMvdm2
 p/v+DHTfCO6aIasR5KTk9NUS2ZcX/TZkx+qU+E2TzUArgLxE8hZ/XSHOm3PpNUcaj+hujP5dosa
 va28RMWRVYp/PMGy1wlgTt6sT/xvJL2gw9Pcn/VvqgCSrFIn8AvbewfnQb9GIGqDhuphuTGSB5F
 +OVCAvjfc0WV5vRAYcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Define VIRTIO_ID_VENDOR with the proposed device ID value 52 for generic
vendor-specific VirtIO devices. This allows vendor-specific functions to
share one VirtIO device ID and be distinguished using their vendor ID and
platform description.

The value is proposed for VirtIO TC allocation and must not be merged
until the ID is formally allocated. The DCP function driver should match
the generic device ID together with Qualcomm vendor identification and
the DT-described transport.

Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 include/uapi/linux/virtio_ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
index f9056af0c622..9a8b6a6a03a4 100644
--- a/include/uapi/linux/virtio_ids.h
+++ b/include/uapi/linux/virtio_ids.h
@@ -70,6 +70,7 @@
 #define VIRTIO_ID_GPIO			41 /* virtio gpio */
 #define VIRTIO_ID_SPI			45 /* virtio spi */
 #define VIRTIO_ID_MEDIA			48 /* virtio media */
+#define VIRTIO_ID_VENDOR		52 /* virtio vendor-specific device */
 
 /*
  * Virtio Transitional IDs

-- 
2.43.0

