Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518141;
	b=q86uJj9rEQou4tecewfRO4xdhTiiWUH9bl83Xz1Jbb+32bwZsfKbViqAtJ9oXYU0NjBs
	 SaSvtThmBTiadiQKgNqyJ8bHh7C3LZr89Jrljlr2Y3wGs+tvTqiSiGcMFHklVXYjLqDfW
	 GdPQoABpt7/U3BKHDTHKUVjo8T03uwCUg6puE3A4xiBgWxPOylYiwWGl+pTHVPVGzDPC8
	 bFkfmqeFGaAfBjXGOzkgshzhBKJBME2uc2OOwNtdbeZtHfx7TgtprKwdMTofkmSQMk5sB
	 raOX5N/mYgyfQExeEegY5p8QpS94PZtsBqVRFc/raO7RH35CG6vWZZY3PIYA7MAMHoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518141;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3lGA1OPjnX3GJpn28fjuGpkD9i66CpvhssS74bIfiRE=;
	b=G0YWmpvtZlVY8tet4O4LAKNZ0GLoa8Absf4eADJJ9S6Sn3IzyhuCgadgXZodTJBFMY6q
	 +l1QcAVfSsZLXtapzbiX1tPj0+lRD+w3caiva8Ll3dGGcv/1H/sn0CSa2p+HSs4nSiv0b
	 Pr29joQ74aGd+V20cJy1TnB6isXq2uqqu3tnWpHwIxhv+1mCsWwQedU1NUjNNBKHC6HHr
	 beZkPeLW82+fy6VSJ1fIkREbRF+79ctPIZV1H+NpdVZ7O61kLCHI5k6dM5YDjfkTfrhOz
	 fQ3pf5+qnOAjomZbmSj2VnCELlGqLEKV3PEda2BC+9lXNR0xdF1E57oBEIprL7XRTww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L4ayqnk4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NaoBtRb6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54DC606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B54DC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L4ayqnk4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NaoBtRb6
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuUSQ120292
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3lGA1OPjnX3GJpn28fjuGpkD9i66CpvhssS
	74bIfiRE=; b=L4ayqnk4m5TxgGBfWewM72R9ZOlKRwQXVF0UjAOpY53ZaI3EO8e
	cTgDzy6UVynL5QDqEDLuYXdufir8MkjrBJcgtdtQWAUJM029LMoAqHgiJ8Eq2Ia7
	83FZgroMijiQ0T+uQLqWLFoEIZLKvvVsACLo1Nf22aqsAVkem6aaLWXDwzhIjyNy
	UGF9Mj0YQVNdxPu2+sifzJz7rSh1cShl7LvHTzKx1ZT2qs4MO20U10oTP4EUxqd5
	Mp8QVIUfqqY7CERv19ByeYYZ3SoiLajM6QVdHw9smr6ZEUK1QrVkqW0k+qb0J7SB
	Z5hEqlTVQ10IXKTzVm1WLPbV2uJ9TBxtPtQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f2phr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:02:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b8cef34b43so4694470b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795518139; x=1796122939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3lGA1OPjnX3GJpn28fjuGpkD9i66CpvhssS74bIfiRE=;
        b=NaoBtRb6TjGt/5+4DskJTyhP5MJGwsUTlx1u9KtXZLv4EgYpegeg0uPXSmlW2X7jIA
         +VJlcbcsEW0fqvxcWFd08VEJT8klopMdDC7qlBrCp8UJQwClOo1EVIoXHRHRHrJ+2rai
         IRu1XulCM1U8Dq25ickT2JGGTI2LdQkD8dfgWlDWqPi45UEve61+IzB3hg+vJN/pOXd7
         N1UpxfFz0cyqLFcHpOW7Zfiw55nO3cuRZngDx5sCCJhiuIUQKvVXujVEXixgj6UAVKIY
         SZrCezILNVESZoyJ+r2ECk8zNfREC9vAd5wy61NTrW1AZX5HaGhbCfs27tL3yjIxPBQ9
         QR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518139; x=1796122939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3lGA1OPjnX3GJpn28fjuGpkD9i66CpvhssS74bIfiRE=;
        b=Db17uykNd8xk4cZIvadyg6RlkfTxW7sTtBBH2Uhb9BgDOUK7BI+ZKgeUgBYlN4iE/k
         fdhJPpZsYbsp5RvhdIoAtIlNcudYbo2jAyLuaGpWAfd6bc/KCSJhGg219gK8UM4Xdct/
         XbctcTuVeG+vONcM4QCHHfAipkLe3Xpd8JQLs2tbsm5znV6iNn12w6lOjXMKzksbrweo
         K7kdoqTziSlaRU3nXPdUKd2bgJeFzQtA6+QtXSCvrTRx65BeJAXfrpkxmOk2Ffm5PgPW
         V/W2n1wpvfsxWj87TGXYgN+c/g1li0RItdzX+7/e6AHHJs5BCF/gR1VCDnukSILrJZnj
         BDdA==
X-Forwarded-Encrypted: i=1; AL+hErG2yZDibhndgUbgd3+XTJeuIB4NNsC7ODfbM9np6CVestyMHx7MdqdpzVZksL3RSRD4Kkm0jzbB8CKhDeI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CDp0Hm0fuGfdAVBdQqKwwzWDguWckf0VqF+cqg0W5a4n80B3t
	kRn/FQUV3TjtWMd7NegK3f3LpqOydbvxs7KEhIh79tV4QrWZW6uJzK2pIgGrCGHD6f3SFbOGI+9
	IgWT9zVqB6CG7Prf2DAiglI9EREAo0sT6NrdiEHhSRmOtFs/iCHTzno6U+Qv98ZV9eV0=
X-Gm-Gg: AZFdTZf3rxrxOKGVlgsDYvOdZUyD5lvyb0u1OtezHQZUimQR/VhbtLKW6AUgBzz9LuE
	fCKXW+K8U2Soy4zLOVhnJ8FEDqChJszRHH0GYj6w2IUtVV+844PgXPPcEHEEf3/oQibUgMKwgsJ
	qUjNUblpZ2v4Le6BzIybAtJrXny4Aq1LSOzWhM/S0CmFgnPYX3gDA2FqqyKWfcgBQh33mhoosm9
	66+qpmGe03cUTxzw4yTvjByd8pYhuQLI4v959VLvPRQFhbA4YwQlQrynAi8upK2APQ51gk1xCkr
	2koHuPcDWGTekYRLEzTNZl5pmZefQhiYBgAZStBbAhl1Dvqlm/hekgSFeI6vkDaAsNEF/+USDFS
	NtirpPexP63QZ1eomq9D+YdV1Ma7HEdpm/EKEaXNKX7rancgPxc/lEhS3GZuUvhc1bMOEImCKbI
	w0QVZqD1MTmNHu3h59c/pVplyx20+5f+P798FcrkvibE1QGBnUER6EBwgT
X-Received: by 2002:a05:6a00:244e:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8c87c481647mr12818935b3a.35.1795518139146;
        Tue, 24 Nov 2026 03:02:19 -0800 (PST)
X-Received: by 2002:a05:6a00:244e:b0:899:13ee:1bd7 with SMTP id d2e1a72fcca58-8c87c481647mr12818897b3a.35.1795518138604;
        Tue, 24 Nov 2026 03:02:18 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c05fsm7087035b3a.17.2026.11.24.03.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:02:18 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: add entry for Yadu M G
Date: Tue, 24 Nov 2026 16:32:14 +0530
Message-ID: <20261124110214.594423-1-yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX1wRObZGeBN6j
 X75tWjMxwuJ4rvVj7vXc0PC5KuczDRk1SxaQ0KeUOLqVE5/mz0uQm7+q7orExSotNZ2mCXuKnL7
 Sdowwcjc3pGg/eIqjgObjhz0V/U04ds=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b056ebb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1RTuLK3dAAAA:8 a=pGLkceISAAAA:8
 a=s8YR1HE3AAAA:8 a=QyXUC8HyAAAA:8 a=V_36NvZ-483JdQGStUMA:9
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22 a=kRpfLKi8w9umh8uBmg1i:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: I9CZZFUYxUuUkCgzEEVf5uB1eQbeDd50
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX0+NqJShfzrdR
 81OD1+Ex1Ow0Nia2WsZ2nKAGFPY8SHcK/J6HD5PE2RyzJLARHTsAc/FJwB0LjPUTFzNGFs+9NlY
 4kVhY5n9/ymx7KiEENCc0i++/cygZ+yrBEE61gkzKf0NuWLylA8SXvlngHdnXypaTag9r31tu+/
 YfKbNgwyUYNLmHaO/GKW1NgGPOZFolLBenNxSyO7zW87PWls0ulLgG2rCXQep9mOnQujPKwTZV7
 p+JxQcvSzPQw4r4QkTPCZGgEVwpNoGUTzcGR+U1gzes0cdJtDog42Ve5E3LMoCXTxSMYQDIyyFM
 /OwF/3/1uLY/S050lU1cof2brVc1MqTeZOwrop6FZ28WvICDst1ZZ11r5/phUuv2cj7DXcpgjur
 bm8g19fe6gkzTdqyLi1wvVzhrwtnXWMCos7s7cLV+rh4M1Huo1ObF3gr3RMb7/4DmFGe+zI1nNW
 0AcFLEhNfXG4ytnAUaQ==
X-Proofpoint-ORIG-GUID: I9CZZFUYxUuUkCgzEEVf5uB1eQbeDd50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Map my old quic_ymg@quicinc.com address to my current
yadu.mg@oss.qualcomm.com address, since the quicinc.com mailbox is
no longer accessible.

Signed-off-by: Yadu M G <yadu.mg@oss.qualcomm.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index cda17fa320dd..a0b5c8ae1313 100644
--- a/.mailmap
+++ b/.mailmap
@@ -1058,6 +1058,7 @@ Wolfram Sang <wsa@kernel.org> <w.sang@pengutronix.de>
 Wolfram Sang <wsa@kernel.org> <wsa@the-dreams.de>
 Xu Xin <xu.xin@linux.dev> <xu.xin16@zte.com.cn>
 Xu Xin <xu.xin@linux.dev> xu xin <cgel.zte@gmail.com>
+Yadu M G <yadu.mg@oss.qualcomm.com> <quic_ymg@quicinc.com>
 Yakir Yang <kuankuan.y@gmail.com> <ykk@rock-chips.com>
 Yanteng Si <si.yanteng@linux.dev> <siyanteng@loongson.cn>
 Ying Huang <huang.ying.caritas@gmail.com> <ying.huang@intel.com>
-- 
2.43.0

