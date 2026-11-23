Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465383;
	b=z1ODeEmlM5DwBb9XoH/Z/AvW4L1ADpriYFhuGtkVNmYK++iedcBh8REndJja2odjy0Dd
	 +i3HEBAOt4QQm6/Eb64MSdXsm1PnfiDsBsoJx/LSm1lf/VFXXCFDQF6+TzfPIn2C6LiPz
	 oFsvj8f9Q00U1b6uU3o7HHAWBRi1ta9yWn7n746xgYBZPuuR3NCaro9VVHyeqkEAc77z7
	 QgAKaXJh6E6hiKLFcHTzm9foTlpAWU9zKMPszvPewHdjF92bLAEEvDinA5ABWixxW9QqP
	 0q/ER/F3M2LmqdfNvvqZfRCXAF0Z1oDxJZzMVZhO74FyFNhp49BCb5ak6c5EPYqwhyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465383;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1aWvYhbVjtxz9V9hbZtcF6tXHCVImD3NnoQvdxhoXCE=;
	b=PCNWrdPirg3nskTkI0RICxLiqTbgjqA/Bk6NtekrTniururo6/s5a1cuyzVnLbWaC/bc
	 ZfxDf2WhGGt+pRqP05uHFt3bjMm7ZuJvBmX8fgoaVDXCP3aqj4Q1G3STGEHRiPCZonLNU
	 3+px0BVnlpykt1vaHOnyB0tHdwo1PWrQMRb+1R1FqfaqLEIg9Cpy/1zFJzFXURdfqLtSh
	 yKg3SHnhkaA54YFB3emOpx2rsJyLojPSJRF8/dc8Yd9dpsqFVr2cTjEFonsAdm9gb/nGL
	 OIdMtaskqoBjitGnLKm9V3Idmcs+pPgVGIGbl2uXHi6Pe4l8UgwIPmknXiy6LSspIQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORlQV9Eo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kU5VWLoP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97388606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97388606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ORlQV9Eo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kU5VWLoP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuPXd2349996
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1aWvYhbVjtxz9V9hbZtcF6
	tXHCVImD3NnoQvdxhoXCE=; b=ORlQV9EoCip86aWWPElorYuikIXlnMXhJ6htJ7
	94Cg0piRh9hTx02TMUUtN0mbTic50oUTjEvBUeG0TUDsMiWcrdvAFbaJNtzOS6/3
	7N911AtFT75D2t9h4ZGkEaPMO6wYPsQJbRiSkqBfA6kgz8cVeyXvjdk0qj4NC2X+
	m9tmFOgQCJVZwSR6SQhGnPpHL/kRZFWwstjUVkGOavKNhALM2RDkXrGJNLf03sNG
	B5D6PwXGbl57hj/rEpbK+MbhGkxd7QGINqBxYkHwZE114Co2q/PLLyVpzK3Y3ipf
	bwVs//gOWH2qUo9S5MvIKhd3G9LgetT0BScx3VUmja+FevXQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a39by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 20:23:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso719050785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795465381; x=1796070181; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1aWvYhbVjtxz9V9hbZtcF6tXHCVImD3NnoQvdxhoXCE=;
        b=kU5VWLoP2sar20qVQjC2RLy4zRfRmIGaWbD6QQHSOxQL4FoIRnnZFuXUawLAiK7EsZ
         /zUwbqh6iaaSD8VAAqYepYZC5RxwmTelGRH+p/CTMIaYnEp9hdRcfy3CIxLM8QfG5s8s
         tPgJLuWMC47/sc4GLUAxvJ1O91l2IsOq1pLe0A5bxXyxzy6xrQmltxB7CJLDg6xtIn2F
         Sf5eESpXwM3XS2k9bOEcYrGMUu+fhZ41AjjMfsxuSjnLPy+Ap4f/sRhnQnzpXwNQBFte
         X71HiVZ7mT/B6S/fLVPF7e4qIHY4QV4drogc2wkmBKKtQmPeG7WwQ5NcuQh/DXIsvFck
         tLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465381; x=1796070181;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1aWvYhbVjtxz9V9hbZtcF6tXHCVImD3NnoQvdxhoXCE=;
        b=LfQO53sH9OIgBp2OoGxAAiPWMVGg9FHVlxmpV8eEtKPynaon6FR5XTJGSzLnAc6TZG
         8LPgB8EF6os2n4h1VR5r4ueSeYxWL7xcQx9R3zElf19sC0/kBNdZ2D82AdSlvclZjyZS
         W88uNaaNG2+Mn+utprZFk0JzBmtpUb4FQiG83DxXa+8WZDJYhTdyUCP+6UWsHoF7+2IJ
         F/V1UhtbHSuS2bJjHu+pkkgQSnQ8JBHfwXvUOJS7U/m+E47VHi+D3JFZ6y7Mya17exZH
         2ElMMfGAaPZ9STGneXo0rgIUkagu3lUgT2XX1s0ikQaDMk9w+4WewQDc+bLH9NkrQ9G3
         WIzA==
X-Gm-Message-State: APuU4Z8D35gJBtn69VDGDO2OOX5Zc9120jyqMNW2JcYwcyxjWn5Y9g1W
	CYiUWUvs5CwfC6jn7EV5vSBwGXhNt1vh6q81eEVr2io8QLAfeXB5MfvBvvJRt7bAtrOh59Y826v
	Ri0qxHbhK+O4H28BX83bQz3ECPCLJGeEl0CFcYGmBOjV/U6mDsPoxlSta10Ajpekc6ao=
X-Gm-Gg: AZFdTZerI+5/0Og94usMXp+NERRjRXdcs0KKgrpOH248yjj8rHb9O8d/gqW6tG3Eht8
	u/5LqhWBsHxDDSEvV7iBXhrVGr0XaCqG4yqlEYnSAUTxchgr/I+RLZWDzCxX0duKHfCZvQLKz+Z
	MbX5Y0IzHmXa3H5TSMoyMD0NAprjy69HsS2ru5etKCNKoE5ElZlM25g5LTDsB8EwcCaQy5JJaSD
	3mpLw1HxB7bax9X8WFdUCVeoeQAqykz4i54QQaBEQOjqYE6GtyygJNUgfXdO/3080dOTNNUFLOP
	18ziej020aa458iZCrba5LK9VqarVlbla5uGe9J14ou+X1GzIslxqXzBjULdW9HXlT7ZpU6aACz
	6XhZoZ3UkeP+QEUNhSUheuexkhkaE5wUJbrHKxAtg81pcCU2CJQLltwcNGQ==
X-Received: by 2002:a05:620a:6609:b0:93c:664e:e212 with SMTP id af79cd13be357-949ba9e83d2mr1897547485a.32.1795465380554;
        Mon, 23 Nov 2026 12:23:00 -0800 (PST)
X-Received: by 2002:a05:620a:6609:b0:93c:664e:e212 with SMTP id af79cd13be357-949ba9e83d2mr1897540485a.32.1795465379913;
        Mon, 23 Nov 2026 12:22:59 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853ca452sm371057095e9.15.2026.11.23.12.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:22:59 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:22:51 +0200
Subject: [PATCH v3] pmdomain: core: Add tracepoints for domain state
 changes
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
Message-Id: <20261123-add-pmdomain-tracepoints-v3-1-1b41d412b455@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJqgBGsC/42NTQ7CIBQGr2JYSwO01OLKexgXyI/FWKhAiabp3
 YWauDLGzUsm+d7MDILyRgWw38zAq2SCcTZDvd0A0XN7UdDIzIAg0iJGGsilhOMg3cCNhdFzoUZ
 nbAwQU0IbTYRskAb5ffRKm8eqPp7eHKbzVYlYfGXRmxCdf67thMvuj0zCEEPZMV1rxFvGuoMLo
 bpP/CbcMFT5gFJL5OPDGNEfPpJ9GLU7whhVmNIvvmVZXs/eWFUpAQAA
X-Change-ID: 20260924-add-pmdomain-tracepoints-15254f2cd40f
To: Ulf Hansson <ulfh@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7694;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5IpYGtc6Z2Ef59L/WU0TjMp9lBqUVNrcPzzYI+VOL2c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBKCdJoLi8IveMV4pWSAAZId1qpfdLPDdvNMMA
 px4W7PhkkCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawSgnQAKCRAbX0TJAJUV
 VrZpD/wPO5PB7eboGgmJezrDT+kH4nQXRBqpR10BhCECsNllOWkm4o1AX35h9r0CE3KaInPHx1/
 8tQFLyxcOJJfLbcoiG+AEuMXzNMloqmJlKNmv6yOHDkmDMfTZQo+tDbrlCoUmMmlGf6gjTojS03
 R4oXXMEwL17DRO6lzJmh5MolKj775wGkig6A/Xvnw4jmPORPWQFNoVHNbYjddHRBckGtMYoculK
 eAhflCge41rThUYKXZOjPE+8H/8hPAShcaAGJ6Y+0+pQlzzJBN5vgfrYCcAD1s551XI6LmT3kiu
 ZG4Takd8KPU/rMNzJP49tGW/5roH4rHitqrB6qNKWfIi03SkQyBahdYsHFaFrtBxqVeeKBH1W2y
 gQdfuqqqYA0Xm59J91Tmi+56+9f4Ay0k2dLkM4xqFdNDMdoSjBIbEAMscMEGYQEFOIK/o1Qy5nw
 DbUJbVukl22nRwAvexs7tZULXKnTfAF2B2l5zbgusvDgro0KBYmR/nWAUjDeL9vM60F5CZG2DEy
 qhCDD5pHplzj0ACSWMNV9RcT3mHXs7CGA2Oi1wFbv0NnNkxpYsGFrn6LLBrUHfnMpuRm0YAnD3+
 IhQ5mj+fmk9XZC81J4rP4V4hHr/vGi+oGOqD0M3URm5lxDWtCKeKnTy19NS19xIDyBPd8vmcBJs
 f6hKPj7xH78qk2A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MSBTYWx0ZWRfX79tHrjAgqH91
 J8c63TjiwpnhFJXhxAC+Y0goZEICKMgzRqURLrEhbhSPEaz9Bem3bIZ+dpCiKZKeSoA0/DQIR1x
 tvSASEaEHpzBB4VL3Y0qXx1sOEHv5II=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MSBTYWx0ZWRfX++A3EhfQkl4l
 cUQz/UaLpFIiK1XkLY/+DWfGMANuR7yQi6Oly/FMmWqi2ct8krLsC7xJeoDswGSTtbo4lX32sh6
 lLZGfPG2Igc26N8MPZlP5fBHWwqYotRQNR+EEZoOjkstZgrrQ//UTwf/9baetyw8rxNkztFXods
 ngN6tCDd8wUekQpSNndLsVVKIGZiG54qzjnVEC4SmiM2QRiYJ9eQacepkyLs5ixwDotv9Tsjm4N
 el7A49Pm8dtVB9PpnyuUYcq2DaEtExkR6B9FGFmXTj3kXpkkpO3g3fLAvXjYh9R3rNeXnz14Tw+
 iLZxXYAv/D2aEARZnBTipoT89A/wQdg6WJzcG5ZZx9YVcJ4hjpavbUhp6duPC0eRyaOtLzXu4Ax
 stz/wwkUR5wm9ELGGPgoEgyNNf0uIRB/awlSxBh06iMGSV0gTXL4MZbmSSfRHMaYUafNEXYnc2m
 TAWFIyFoL0MA/T1U4Ng==
X-Proofpoint-ORIG-GUID: JeSu7eaAarBn2ZxnkafgTjkdvzDCj4Es
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04a0a5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=_etmsl0bOIUhBZk5MHUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: JeSu7eaAarBn2ZxnkafgTjkdvzDCj4Es
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230081

Power domain state changes are difficult to correlate with device activity
using snapshots of the genpd debugfs state alone.

Add tracepoints for domain initialization, power-on and power-off
operations, and performance-state changes. Record the domain name and
initial power and performance states at initialization. For power
operations, record the idle-state index and return value, and for
performance-state changes, record the requested state and return value.

Emit the operation tracepoints on both success and failure paths,
including power notifier failures and performance-state rollback paths,
to make failed transitions visible alongside successful ones.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v3:
- Reuse the genpd_power event class for genpd_set_performance_state
  through DEFINE_EVENT_PRINT, to save memory (Steven)
- Link to v2: https://patch.msgid.link/20261105-add-pmdomain-tracepoints-v2-1-10672995e155@oss.qualcomm.com

Prepared with help from an LLM-based assistant.

Changes in v2:
- Initialize ret to 0 at declaration instead of assigning it before the
  trace labels in _genpd_set_performance_state(), _genpd_power_on() and
  _genpd_power_off() (Ulf)
- Link to v1: https://patch.msgid.link/20260924-add-pmdomain-tracepoints-v1-1-d89f3f0a6998@oss.qualcomm.com
---
 drivers/pmdomain/core.c      | 30 ++++++++++------
 include/trace/events/genpd.h | 85 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index e0bf30c59cce..c8bc57407634 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -29,6 +29,9 @@
 #include <trace/events/ipi.h>
 #include "core.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/genpd.h>
+
 /* Provides a unique ID for each genpd device */
 static DEFINE_IDA(genpd_ida);
 
@@ -510,7 +513,7 @@ static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
 					unsigned int state, int depth)
 {
 	struct gpd_link *link = NULL;
-	int ret;
+	int ret = 0;
 
 	if (state == genpd->performance_state)
 		return 0;
@@ -529,7 +532,7 @@ static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
 		if (ret) {
 			if (link)
 				goto rollback_parents_up;
-			return ret;
+			goto out;
 		}
 	}
 
@@ -543,15 +546,17 @@ static int _genpd_set_performance_state(struct generic_pm_domain *genpd,
 	}
 
 	genpd->performance_state = state;
-	return 0;
+	goto out;
 
 rollback_parents_up:
 	list_for_each_entry_continue_reverse(link, &genpd->child_links, child_node)
 		_genpd_rollback_parent_state(link, depth);
-	return ret;
+	goto out;
 rollback_parents_down:
 	list_for_each_entry_continue(link, &genpd->child_links, child_node)
 		_genpd_rollback_parent_state(link, depth);
+out:
+	trace_genpd_set_performance_state(dev_name(&genpd->dev), state, ret);
 	return ret;
 }
 
@@ -878,7 +883,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 	unsigned int state_idx = genpd->state_idx;
 	ktime_t time_start;
 	s64 elapsed_ns;
-	int ret;
+	int ret = 0;
 
 	/* Notify consumers that we are about to power on. */
 	ret = raw_notifier_call_chain_robust(&genpd->power_notifiers,
@@ -886,7 +891,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 					     GENPD_NOTIFY_OFF, NULL);
 	ret = notifier_to_errno(ret);
 	if (ret)
-		return ret;
+		goto trace;
 
 	if (!genpd->power_on)
 		goto out;
@@ -917,10 +922,12 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
 out:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
 	genpd->synced_poweroff = false;
-	return 0;
+	goto trace;
 err:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
 				NULL);
+trace:
+	trace_genpd_power_on(dev_name(&genpd->dev), state_idx, ret);
 	return ret;
 }
 
@@ -929,7 +936,7 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
 	unsigned int state_idx = genpd->state_idx;
 	ktime_t time_start;
 	s64 elapsed_ns;
-	int ret;
+	int ret = 0;
 
 	/* Notify consumers that we are about to power off. */
 	ret = raw_notifier_call_chain_robust(&genpd->power_notifiers,
@@ -937,7 +944,7 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
 					     GENPD_NOTIFY_ON, NULL);
 	ret = notifier_to_errno(ret);
 	if (ret)
-		return ret;
+		goto trace;
 
 	if (!genpd->power_off)
 		goto out;
@@ -968,9 +975,11 @@ static int _genpd_power_off(struct generic_pm_domain *genpd, bool timed)
 out:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
 				NULL);
-	return 0;
+	goto trace;
 busy:
 	raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
+trace:
+	trace_genpd_power_off(dev_name(&genpd->dev), state_idx, ret);
 	return ret;
 }
 
@@ -2576,6 +2585,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 		return ret;
 
 	mutex_lock(&gpd_list_lock);
+	trace_genpd_init(dev_name(&genpd->dev), !is_off, genpd->performance_state);
 	list_add(&genpd->gpd_list_node, &gpd_list);
 	mutex_unlock(&gpd_list_lock);
 	genpd_debug_add(genpd);
diff --git a/include/trace/events/genpd.h b/include/trace/events/genpd.h
new file mode 100644
index 000000000000..2113bec56e09
--- /dev/null
+++ b/include/trace/events/genpd.h
@@ -0,0 +1,85 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM genpd
+
+#if !defined(_TRACE_GENPD_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_GENPD_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(genpd_init,
+
+	TP_PROTO(const char *name, bool on, unsigned int performance_state),
+
+	TP_ARGS(name, on, performance_state),
+
+	TP_STRUCT__entry(
+		__string(name, name)
+		__field(bool, on)
+		__field(unsigned int, performance_state)
+	),
+
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->on = on;
+		__entry->performance_state = performance_state;
+	),
+
+	TP_printk("%s on=%d performance_state=%u", __get_str(name),
+		  __entry->on, __entry->performance_state)
+);
+
+/*
+ * state_idx identifies the idle state entered or exited for the power
+ * events and the requested performance state for the performance event.
+ */
+DECLARE_EVENT_CLASS(genpd_power,
+
+	TP_PROTO(const char *name, unsigned int state_idx, int ret),
+
+	TP_ARGS(name, state_idx, ret),
+
+	TP_STRUCT__entry(
+		__string(name, name)
+		__field(unsigned int, state_idx)
+		__field(int, ret)
+	),
+
+	TP_fast_assign(
+		__assign_str(name);
+		__entry->state_idx = state_idx;
+		__entry->ret = ret;
+	),
+
+	TP_printk("%s state_idx=%u ret=%d", __get_str(name),
+		  __entry->state_idx, __entry->ret)
+);
+
+DEFINE_EVENT(genpd_power, genpd_power_on,
+
+	TP_PROTO(const char *name, unsigned int state_idx, int ret),
+
+	TP_ARGS(name, state_idx, ret)
+);
+
+DEFINE_EVENT(genpd_power, genpd_power_off,
+
+	TP_PROTO(const char *name, unsigned int state_idx, int ret),
+
+	TP_ARGS(name, state_idx, ret)
+);
+
+DEFINE_EVENT_PRINT(genpd_power, genpd_set_performance_state,
+
+	TP_PROTO(const char *name, unsigned int state_idx, int ret),
+
+	TP_ARGS(name, state_idx, ret),
+
+	TP_printk("%s state=%u ret=%d", __get_str(name),
+		  __entry->state_idx, __entry->ret)
+);
+
+#endif /* _TRACE_GENPD_H */
+
+/* This part must be outside protection. */
+#include <trace/define_trace.h>

---
base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
change-id: 20260924-add-pmdomain-tracepoints-15254f2cd40f

Best regards,
--  

Abel

