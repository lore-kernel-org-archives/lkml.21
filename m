Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088765;
	b=yqE0z2jj0EFwpgjKfAa8AO0SnbcIV7OozEI0d+0qXMXy68EXg6jMDASgDwxJ5ealTQlS
	 XFUAsXIOf+4luIrxg2BUN1rJFub+uM+5LliN1C99RwpTtaZbsjiXXdhSBm6vLa/5UkFqc
	 AC1gImcNOD8qzqh7UxH7R76Pe9ZlximLQxluINURrou8hvW07O90Sl8yamKLi0YDgQhA8
	 +AxGOj8+UvzLSoKrTiTFCPwygkyrs1cunkZ3yKr62t15B4fD13uMMo08Ig669qSeBKSJE
	 RItFvJQbSbSOuoiGP49NXVADTn6vPUOlgaba5Tc+wHvyv2niBsLWQiIHNRZ0bOULYew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088765;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
	b=LxmWuoRS3O1ROiaO0Vwz1035bEUXP9UksZxxsutqfYG+QC8HE4L2kw4BlgyOqAKNom8O
	 7/T5Htf64Huv3U745lDMBABQgIN1lm1xASN8Rf5mFaO197kZaHcz2OI4YJxzt4fUOTlCP
	 H6hGWcBLP0dj6RHayUMVQ5uhEeuKkgfIsAC8YdEOhrB88lDXRPh1e2nq2ND6PIWkFfwus
	 vb4EMdkqC9Bida85hf7YvnhJKkGek8sG4iP6F1DchqcFN0WuWxitEQpkOa7aRnGn6j02k
	 /E4Y/mIF1p9QsMoE4npriepkgEkp5Pjnm6dOH+Tt1RtO34AW9CiiTlRlWIQX/NaUtBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDOWStr9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kigHcnCh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD89F606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD89F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDOWStr9;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kigHcnCh
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBk4wH1655318
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=; b=WDOWStr9mzyuwxBh
	Ydkv7AhoWQcqjQb+t+u7KfCmsDDou8oeLwDPCzk59CIVbwP0sROVTJqdlBrhivt5
	3XKW5sJQg6lJaDX13Gm7cRkZywPTc0cKAEpyQD/x9B92ALJ+QhJ0jEho1Wl0ozLz
	imoo8fv4UaosKn+AYcyIESGfjNikAgfQOODQ4y8exjE1jHSqcExyyn83GEKgQvOm
	49a53cDJRMgyNqBLfQVOdu62ytbghg+y9HEiJNi8e1eCR4kAYmvqsKqMfcSOU2PE
	HvcX7LNBVRdMAn/WHhw25sNeWsdoWmCjyKh8ajT5VSLu45qrG07VpzLDEaX9mrRm
	ZdACSg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1yghg8fj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:46:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b3ad195a96so2305591a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088763; x=1795693563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
        b=kigHcnChGfGZgUVRzvAJSLjsWvxTfy1ClPeX80WEx+NcmvUu6aB2jUKno6VOYkYyYk
         dSPnA3SMLRe7I4IK6z4nC5B0xl6pwvaaIJCz+Bufy9NbciY22i1rxisrk1WFZceCcAnC
         JK2n6BWc/nySnx6FWIJxg1Pbku/CTI7bFlW5LEESFBMtTYDzMZWzTTRigEas4HXlncK3
         iMPa4HYV1njYl7BA2F1sEjxlBLrezVHiqydCQTaRchCCS0RX29/zF9cewuse9/6UILiR
         bVxluja7QBaSJWq69PGt9tdi6eeWNA3DJohwm3ImLimqyP1P4St6T45+UO9keaime5t1
         YYFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088763; x=1795693563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0gDbpRYwXjrOiNSKkytD4TVz1o4q/cXx/36JYdIpmc=;
        b=FgCMGf6ux61DAYa9B7N8EC6ZYg3/wTa9EvUW8EBp8jyY73VpnIT6HD06TB7NaOYCZh
         NUVDOUqFrjJ+BQBp69IQXzUIn65W3wyfn3sJIvCMEbqKS4QLu9dnasNUZ0cyRKplWJ9r
         UX3IwG+If3HI1eNVYzX3TLKex8/sRcpv9qzZ+5dFXKcXrjDbe9/kK3ghpKQZApD8wj1a
         OXkh6FdoZwvhdTahUekXTcuj3TeuagLvS36iqUwSoO5PhO63nHIwtHui3gy2yit63fe5
         7KEO9llQGXC2ixPzNKY0fpkGrzbdVZpzMBtFV3qu4hftFVWTqLcAUBbTxQFdqyY4rTCm
         Fbaw==
X-Forwarded-Encrypted: i=1; AL+hErGoysfozfNQ1jMFpGgVQQt0abq0RBcq1SVS3zOz08j5Sm1fzdqngsB+4duX4nQS2nJ9WtG0T9bm8+hdGS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pxQ7GsdjmvIoeR/lBrO8Mp8E23dX2i/JNhwcoisxF/Kkz9/cK
	nGm9xkad/YmVMQRdIVPQxGnKJ3iYFg/IfkeNaiDoFWTkoO+cvgMJcN03sM7JlDVDmVlbCsLI1vO
	wKvXKKAmSAR4EoXQpsOxj+hR7XnOh8hnvi8TnjQnpG18wAxrrpXIjUsxFNQUh3avKYuM=
X-Gm-Gg: AZFdTZfd6qeCuo0vP4ty/JvbhKTPkL6/UvnUdtuKdM9CX0yNT54GAZ0aXZ9elEByNw/
	9rGk+i0nU1pxD6I/Quukg7EYXE3+lCn8bt9BsrD8pBQdNVaJTYmvWZCMxtw+Fw05txOZQmzmCkx
	27wjB6V9aUyfl2HRhBMsJHWfat/4+d6NgehUXJigVw/emW9K+D9FMksMIs2xaitd4iwKhdLGtDg
	XZuc/lRUA3GHkINx2v84MfrJZBF8TEUCom4ijcuBZ+pgHZGihAGVdlLhxE0fUB52qIxVkavnZ21
	qcaGV+FmnTOoWDxtGcASA0N66c1IR3AFGDfJbvflzpy7NYZevJ2BPma91KG09Fvsl7d0mahfTAu
	PSxz3dOrUsg2HSXCGYvp0SUe+cKTTlkdRSltemEapkuXkjPB3l+akVQ8TNkFhDIPQ9c6MNTHvhA
	B8YNl+9wQ=
X-Received: by 2002:a17:90b:53cf:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3b3d07e395bmr4885583a91.59.1795088763489;
        Thu, 19 Nov 2026 03:46:03 -0800 (PST)
X-Received: by 2002:a17:90b:53cf:b0:3a4:ba6e:65c9 with SMTP id 98e67ed59e1d1-3b3d07e395bmr4885554a91.59.1795088762992;
        Thu, 19 Nov 2026 03:46:02 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm2397030a91.15.2026.11.19.03.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:46:02 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:15:30 +0530
Subject: [PATCH v3 1/4] media: iris: Fix runtime PM reference imbalance on
 failed resume
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
Message-Id: <20261119-iris-handle-unbind-v3-1-52d467a13907@oss.qualcomm.com>
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088753; l=1181;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=uA1DrNWOT1xdT5YBsROagD86Vd8Mo/RENc8c8k3PgK4=;
 b=IsI5L6EEjV4Qdz6e2J2ZakNsX1pWElNbeF15477Ach5NNo61xxfxA3cpi/ZZ1aB4xMWaK3yxt
 UVJrOvLNc9KD11ApcJcsvtR8WVLf2iGJ7BbmrZcEosCsxYQOfEPOky/
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX1JOYh5JmhwMy
 MXJ5Uy00bAv1JGq7O/0asGbqLJF5M9q3vHt9QAxqZyTpELMK8tODqyV6kwpMrS06dNF/oN4N5TD
 BkOyNjDq7PslBMCmwiQ3t32F38Uww3IFVAajgj2y/VIjB6cEAievwAEnXiAj4waZXrnIS55lE1J
 mJ4K45djVdvqw6fidYQ8d5CuExZx9QRhBF4/tiRceOkaJuG7SBE0FKqhMXT1Guxv28FSNS3cuqW
 0czKt4C03tUxup0Uthk0mh08Gi4fYg60eg1ZPaKdTKDWYImY+WNSfKUj3E/T7D8e1QgYXsj41Ip
 5VfVuCnfX4h0b2iq+R6X4NVZdxGt0rYmoqGgXulPzQzVCsljKFSYRnxfH68Un+AbhX7mou9GiUn
 EUNFdC/gFVg7hjtEMxsoWJy9rQn/WrJM+TGFJhb6XpIabJwLcJ3VuDKAZIu7K8SG+CIM8femEAf
 uhln43lTwkXeLIgfXsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX2iY0/RfxbL6R
 vYspiYsaLN4R7HtERnD8o0Rx17qz3HnGT8/jxO53rOsXqJJJZNe8Mfpeb6KfTIQw2HanyPg1Xpo
 OOf9oi/32hs/uFT/6fpGodS1oZVUzxg=
X-Authority-Analysis: v=2.4 cv=Vvi2kO2n c=1 sm=1 tr=0 ts=6afee17c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ohPow3cFOKvdjjdYMLAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: mBAhFndsbVSQUgbjq7xEqegt27fidj4l
X-Proofpoint-ORIG-GUID: mBAhFndsbVSQUgbjq7xEqegt27fidj4l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190046

pm_runtime_resume_and_get() drops its usage count when the resume
fails. iris_hfi_queue_cmd_write() dropped it a second time on that
path, resulting in a runtime PM usage count underflow warning:

  qcom-iris aa00000.video-codec: Runtime PM usage count underflow!

Fixes: bb8a95aa038e ("media: iris: implement power management")
Cc: stable@vger.kernel.org
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index bf6db23b53e21..545bbe75e1740 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -132,7 +132,7 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
 
 	ret = pm_runtime_resume_and_get(core->dev);
 	if (ret < 0)
-		goto exit;
+		return ret;
 
 	mutex_lock(&core->lock);
 	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt_size);

-- 
2.34.1

