Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518808;
	b=S0Eo2juqFxNvZMn3vusGUho2gDl0aKK5IPlktfdO5CISBCtNxo+2Sx/bEHeVUq8fPbw1
	 /uTUlZDtJdawxN8BNnTCTd2zhv7HKz/jxcEu5l17GVRxJH/XLQ/8/9aDgwHXBAJ25jMJF
	 X7aIFW3pBfmhbS4nyOXJf6ZeGAh2+XIlsLIm+jNqL4LW1sovAG6Hv7Rxb70Hj2ggWrUBv
	 mgfuOUW/tAEmbGAyo0yJpLFE3/LAT2XWnRpp48JToo2RNa4yDzV9u3oTqJgWQzwqaVs6t
	 npfvk3foZsiENPEo8Rhl4kwPIGncS/2ZfwfJONo/GgIwSRbgJu30dFWY7/AVURBwKog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fQtK99vn4dQya8aK5tgZSG1rKrlkKylgmwYEe9Qe16I=;
	b=pCmR/3Z6mp4VD+t1VTEO4bdQJfPd2sXzaZsB77Vl7Aw+zyMe/hXzxBmI+ViX5tquH7BJ
	 wmEgeFePy5NI1WJ/wxcRJ7WaIxdvTcm0qm/u48DDb+KDgzTC+NxHUuEQGqnQNtQnfrilu
	 WoLpqcXbl2Xhrl1gpmfk1h6Yk0KTL5hRQmB6QzPsI2PSGgeMBIlopT6+wdwjEDufD2hlQ
	 8B0e07ezN8PSanXfrkzuHK6JfXO69vtYT5nfbCRzM2qKqjHQMBlzWq446+YBdPgBJ5i1c
	 ku1GitgQJq+CS6n71a5Ug5Qq7e7pFg2ey0tTXfF5/5aQ4FZulhS7Ms+bccorHQnp5+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S2aRjtkM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="I/BUHEbm";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA937606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA937606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S2aRjtkM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I/BUHEbm
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAufbT1025411
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:13:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fQtK99vn4dQ
	ya8aK5tgZSG1rKrlkKylgmwYEe9Qe16I=; b=S2aRjtkM6/QHaSvsXDAiBZIfHik
	if1LpJsmmcEeBeKOAXL2PJz8qNrfoHDWUH9uATE4HLPrSSYWFwEQnjuIw1iMl8fs
	ajTGEVm3AU1hQeCl2KeqEP+u4VmFYjMmOYmmBLMxvP5UVuuaDBBqOSDMsoWlBuw6
	oUV540izfr9qSb0XG27uG0Q34clykCulf17iBJ4f51QhzbTrf+SAWfWlULmbDmwJ
	XFfHL537UJOaO2vc5dZKcOivrhUf3tWEUBxSxiumbSvH1t8vUe1PZffn6KjfNWrY
	dLoseotXOx1QHSJyr0yMOeWZ/StFrtdyjWtOoo6DVSVN05lPFLW+zwl3JPw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yyt2dbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:13:27 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-382af5cfc58so3366609eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795518806; x=1796123606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQtK99vn4dQya8aK5tgZSG1rKrlkKylgmwYEe9Qe16I=;
        b=I/BUHEbmtLA1jLc80yo8IrOCLoxW86crUk2FmK1QaoKlfirIpuBiNp+jt3eeqpdSvZ
         Sji4aWU2H5BVkLUUYGrYxLTC0rDaVKvttQj4DNWs1pepdENXcquMS2FeosLj2BgnR75K
         y4iorKiRuOJPUBLxsM31NEDQPOtkMnhKdZSXRdIH5HDB4YK2e00ToL1mbP5T8ZIjRJvT
         ep/s8PTzEQ3d9Nywj2otOurHCkg0ptTAScTY7fe4xAzbZVp4wX13F7TZarv25QvYhUQ/
         lZF/AT1aeKEbgnYjQq86q8sObKzva1lux/zv5hpYKXfomdT2YkuUoUa2aT9V+Mal27Vq
         3/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518806; x=1796123606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQtK99vn4dQya8aK5tgZSG1rKrlkKylgmwYEe9Qe16I=;
        b=XoPzcAWBPU1h/+oRqzzCWFpCc/vliV9MUpd7sYfwgf+izG1p3R5Dk0C2uI7M1Wb3DP
         5v6jO5mpcnf36TvQvjMg+rwo+x2RlyOFY7LPTO1J+tenD+w4zS2x1sDE6Id4czhGDwkT
         XtS7Lk/heZCSjuFucr3wm8bbWCcULWTX3/+xqwnqkZUzdc0pWOTYn4uF6ByuWfW8cO8P
         OfLjl313//I69siseUSU97HDa91exoq9x4n2qncRb62e+tjkprXvg+xH/GqQoMy6WTuh
         EhSOMvhm1/5w7B1uTRTsVee4nAhuC+g0IVM6mGebSB54bJAWY2nFGKqJ7sIReWba0v8n
         bnsQ==
X-Forwarded-Encrypted: i=1; AL+hErFBD2p8dvx2mpJd1CaihvJDUFjyDjyfIC1dlQwTd1bItAFOlpKJZPuPM3+NV/INshl3rhI9BT8MaLlYEHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3wHsgb7smcQhe9gReVeJQ52lMMToa4rOdz+VinnViRhhi3jCF
	9XnGIrfjKOw3nLQpqI5hvQa6Tcj5zLGdW+fr2V8QvqOfyQpYT1uSeKJHxvgXiwATF2YCVUVRMJo
	GvGsGmw65eOlGei0n1Ah3yldGKz+2ZluDSEKg9tOZGwakWd2Pu0Pt4n5d41ZLiGhBFTA=
X-Gm-Gg: AZFdTZd2yRV3HcPLsYv9JvRYT58fVeNWK7R0f4mhxamlK8Y5i+YQg8225O3IMp1IFJB
	3RZVFyQqVHlMrXq2sSyXb6OwD45NcqOAYDFgz+L5bNcH/b3OxMVbuyULF4fOYTan5/b71rdFkb3
	whrdJfGbqRJsShiY1SKR4L7FJ6xxyuSpfgicGqMEg6PykJPkMFkOJlRmofv9745rnIkmMtO0zG3
	3xrRqkVrJq5c+8FhhuRhSp6TMFdqc1fFKDVQ3s211djVX8j21Qps2W9IxYrTnGY36xZL1AvbID0
	Kc0YX2zOv824cgEX03FEUvYq6XiiKDzl+pzMlpgB+ahbcBbD+yAySHnE8um8qh/J7P0p+n+iE9o
	KUoxk3gUEvbdd/+ZnCSbGtp7sWm7PgKLOnRhjdDjhRdsZdv6H7UZowImMCh8MGhW7l9vfnvHq3J
	Al8vkpXw==
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr5827738eec.40.1795518806201;
        Tue, 24 Nov 2026 03:13:26 -0800 (PST)
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr5827717eec.40.1795518805666;
        Tue, 24 Nov 2026 03:13:25 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm43259567eec.15.2026.11.24.03.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:13:25 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, faisal.hassan@oss.qualcomm.com
Subject: [PATCH v3 0/2] usb: dwc3: gadget: fix request unmap and linearize SG requests that exceed the TRB cache
Date: Tue, 24 Nov 2026 16:43:19 +0530
Message-Id: <20261124111321.2731905-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
References: <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MyBTYWx0ZWRfXya0arkAzJ2zf
 mHV5zQfq9qZd23XZ8O+mCo3bAZZXQaAB1OtUbEW5qo/lEyiYU6PJjXLYdn5oQnAPlrJYB/EMG8X
 HjTSnyWsQDYqAc3u4kbXs4dZdvMJU6w=
X-Proofpoint-GUID: KNqO9tqyU0tZQQZFhQVVcNl3Xif75SYU
X-Proofpoint-ORIG-GUID: KNqO9tqyU0tZQQZFhQVVcNl3Xif75SYU
X-Authority-Analysis: v=2.4 cv=W9OtxhWk c=1 sm=1 tr=0 ts=6b057157 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=BC1X_EGaO9jJDtBbprQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MyBTYWx0ZWRfX7C7JBhyLgdvG
 4xef8qkAw/jM/6lqGJ3hDNw51E8By0daEi5sm4oDmgIY+AF/uDx2exu7vm8ZDWMj6uFkphBUudF
 Jx37cug6gl68xHyTVTljdNMrjR81W+A2LG/diaYNrxxH79UxH2Tb52piwH4Do1E4+4eFPxUA8JB
 q5Bd854HXDKlWKdxJ0KX/XTGQdve85QOvSlnS+sVjVvReRZ/ZzZDtm3kPbzLu+bfhcCXJPmS+/0
 Z/IRpRT446qt+cBXXJyarUW73hu7tNubtUGAcTtNcEaY5hhKz75NEJoeK9gIfC2UEuN7MHB4eL8
 Ik0kDd2lf42xhgd83VcyVmI1jwT95UFGXf7G/8fefsbMKSoVnSgah6B+x6L6BlG4khuo7Dyp78Y
 +D8VLC6nQ1MoubE9/M7DDpFizvAsnPoCWX2KzJLW/k8nlOt5at4A871o/AK+Tpj9LtmrypwK3I7
 VMRHBVmc+dXwzBhwqlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240043

The DWC3 TRB cache holds at most 15 TRBs per transfer, and a packet whose
chain needs more than that is never assembled. An SG IN request built
from small entries, such as a 1024-byte request scattered over 16 pages
of 64 bytes on a SuperSpeed bulk endpoint, stalls with NRDY and never
completes. Patch 2 copies such requests into a contiguous buffer at
queue time.

Patch 1 is new in v3. The sashiko review of v2 pointed out that a
request which is mapped but gets no TRB is never unmapped, and is mapped
again on every kick. This has been the case since requests started being
mapped lazily, but linearized requests make it easier to hit, so fix it
first. Patch 2 no longer needs its own unmap condition.

The review also noted that __dwc3_gadget_start_isoc() errors are
returned from __dwc3_gadget_ep_queue() after the request has been added
to the pending list. That behaviour dates back to 25abad6a0584 and is
not touched here.

Changes in v3:
- Add patch 1 to track the mapped state in req->mapped and unmap
  unconditionally on giveback.
- Drop the req->sg_trb_cache_bounced unmap condition from patch 2.

Changes in v2:
- Linearize at queue time so allocation and SG list errors are returned
  from usb_ep_queue(), and restore the original request on giveback.
- Apply the workaround unconditionally instead of using a DT quirk.

v2: https://lore.kernel.org/all/20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com/
v1: https://lore.kernel.org/all/20261004031445.1450196-1-faisal.hassan@oss.qualcomm.com/

Faisal Hassan (2):
  usb: dwc3: gadget: fix DMA mapping leak of requests without TRBs
  usb: dwc3: gadget: linearize SG requests that exceed the TRB cache

 drivers/usb/dwc3/core.h   |  15 ++++
 drivers/usb/dwc3/gadget.c | 145 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 153 insertions(+), 7 deletions(-)


base-commit: 8e31dedb9ad496ea7dd7064d77d6f7d459c1c90f
-- 
2.34.1

