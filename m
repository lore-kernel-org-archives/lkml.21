Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808702;
	b=nq0Q0wnppI3wpdt1raPj90eELBv95Y+WKKo6D5TsULOfWH+0oaXmAYFVkaHeqjV52FuE
	 6hcdVB+lg9rRjBySxnl86wT+0qwtOTrqfVnUXYloHJOOMLKEVGCIAhPApNzmuDrGactJ9
	 ueOwtjj/gX6lFqWGn+KGM4SefkEnyl0n0M8Lloynv3PIwORYDqfVtNquVCOm363gpZs3s
	 yfM4pzItwXpQE88eZ07tuzvZmzMiPLDooUcSf+pMfZmqY5mSmgXZ/lvdvF8JdHbrHmyDc
	 Aol3DiDVpHVQZfTEfbjb4fZ/mWyjceJilR5ttrMJsFbDCLd7giK21eOc1nWu5i6v27A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=;
	b=W3OzuKvtBK3RlAAtA8E9oMf+99a1RytWBOeFLd2q+5fcISw823WkezXAjuJWYbJHBOzW
	 FsTnqwwaYWQ1CZDqTe6aHqObC+5C1II1XyWQGaJFNK9LqfF1QQ7YtlsUxWNMPoK7AqrDK
	 um2gftFWFqjyLGhuaWaaWuNWfITSE8n7eoQniuCNyh3ZwdDhIqISEhmTVIbeh0OWJGl/V
	 SDvx6Z4s42H+VGMiBon7J4L6d2AVGBOHbCqLdGWo+w6e5v7YpMjREmVppCBeRJvJIhmAC
	 Iqz8Z3RtP7o+usSAyYi7FyP7+Oq6VZdVtPaJQUF/WUqmDVCLHFSn3Tn3jWMUr0m41Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="dl/yAJg6";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hZoGzBYP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4714A606A682
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4714A606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dl/yAJg6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hZoGzBYP
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJRCEh2668737
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=; b=dl/yAJg6V5IWealc
	HonWl/XayYEuUqwyZ+Kfr8HHgX7Ijwt6uf1DJGJ0xFx+7inn0QANbZjDt49Jspms
	7rPIKLjCydUe6gBAupZttKTZ3FNxYYW3J2mWUd4k0k9ceP1uvjtuoQSh/uDsqSuF
	oM1H+nK0hB5N8sydrAIT8/UMl90N0YdBNwYmAfnP1myFc+dE108gZ5ZaXhG7QjJg
	+GOdnalsEhgmPF1SrhRYXaZyRnJz/RASQWEzfot+HporP1yfMgnijoJXWqdqk4dA
	0nfYX6msWf1/qfiRd3h6ppmXtOyfB/dMz3l8OKWZOGWc3ldZJDL4rCkg865a5yd3
	63WyEw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1jg1bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 19:45:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9493e89d4f9so1123151385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 11:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808699; x=1796413499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=;
        b=hZoGzBYPlg7XOL6uCgdbrBYMOJZ5lYX29+ol4bL3myQIxvXiCw7tWTgQDomkbatHyg
         byPnwSP1K6oBmPWPUl/ZQsoZlAOEcvU4OS2ZjzrXVWg12t5CzGKrTn4FKTMRTxD2jFZt
         y1PPiD3VNV0HbYsN++JgTOxxzg2wKHkX3dfs7aivGFfsPlQkJdknOHeqCsE3ZQa0myig
         PENREqFSb05Xq2iuNaDMzOpEg+QMxbOe66e294qsom0VG+/ma6uvgJUB2GtpZ4cXryau
         7f1PV8UA6ICXm5bnFoYrAPf6tgSTL9Wlv+0Ai0gBjdSKZGom02RXhxeQYMrLX/Zqk/Tr
         BbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808699; x=1796413499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DYGTs70w9uTE7kxNN2SKwMuIU2Rlqde6W7n2IpjYaPY=;
        b=mn1t5z1TWW8p3yMxMMTj8hkP8ap/1h/GNj1zNMNuG/Gircg0z9MFPQ/mfKY0ZlA983
         NUS2x53VG2ZjuiG+RTxWHAHCn8pCbb5Cq4dwTfLOSbTM/ruKTY9klCe0YWwE78wewe+E
         RiGR66SE3xZsH7sDjRAlYMGjeP+sivps9L3AxZNPLopVYySk7BiM1XjwBMUxmJmaerLw
         SUbPciFuiNE8M3lp4Igodx1K76U4BW1+ruHvatEmWG8UDWCXS5VYZjtJi4CKM1w8CZYn
         f6w4Y65Rij7QjAMwSIY4OY7Wauk2gbgkEhOLxKzUVlvHz/zeFZxMYuJAggdtMXN/uhXb
         NGTQ==
X-Forwarded-Encrypted: i=1; AL+hErE6Pmd2MDKSALL9lDydClvQj5IfTL4aw1sJbP6PfZ4wD58t4ELsbNWWZ2oGioIijRWTQ7X+j/XEjAPlGWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9B9fEbdS1jvOkD64OHPSf+2MdeFKfm5GiGteWUovFe5sjzUOE0
	RNzqSDsWIayo8Tk/EuRTY/xRiwRwgU7bH/7Z1n/CSNNrXXQkbYD1/2c/XKK5Kco/e/o2PYITrF5
	bCVgw/Nmt7JrhiZPV1lLAqgdqV/LJDb+99XtBK6xFJvGvpjEt489qi09OX3MVK3ACV+Q=
X-Gm-Gg: AZFdTZdsQnKkT9zmQ4AxWTNAGB5GkpUQibRz8CzmSX8AUaMBxpbyLRcuMwucrqpYpnC
	70oG1+KfvU3kR5A1hVzDbBQPaS89uuoVyvGbObJK9eXzYP5z+S9JmoBN+KzssSEOpFatganyAkr
	GXFuprq+h+4YwCfg9F4uFVr9sV7y9EM93ayKQxyrovPMvItqVQTeSNEdc84Ci1z1wxjcAq7Bcqr
	NL3GMeQu/3DILlKHkPYX4w/3RLFpDHbP8ES+XkOn7bk6tABN2laCih/nxTzv9qM+J8Di0P1DmN1
	V9dt7LTHF9yqw9P2rhaxwdn5C0o3iWfMRiDtOOZmtXqVaqqrtLCbrf7sHbVgxrsaoFeSt0qNZZJ
	p2+3crnYtwD3HDz+xbSMz2+X1pfFYmSPznyoXcbBK96W8a8saScKx99198hvG7L9ewewZwUE0Wg
	Bx534r4mn4ALK6TWSpvRsn+EQ16QJrXQjqjPI4VsGFGdcbxlQxrxSAWhLWVODzjw==
X-Received: by 2002:a05:620a:29ce:b0:949:8901:dcab with SMTP id af79cd13be357-949ba9b3de8mr4738194485a.23.1795808699293;
        Fri, 27 Nov 2026 11:44:59 -0800 (PST)
X-Received: by 2002:a05:620a:29ce:b0:949:8901:dcab with SMTP id af79cd13be357-949ba9b3de8mr4738190885a.23.1795808698864;
        Fri, 27 Nov 2026 11:44:58 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae805575b5sm59655571fa.34.2026.11.27.11.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:44:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 21:44:17 +0200
Subject: [PATCH v4 04/14] drm/msm: order the display snapshot sources
 around its worker
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
Message-Id: <20261127-msm-kms-destroy-fixes-v4-4-242b0a3f8e47@oss.qualcomm.com>
References: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
In-Reply-To: <20261127-msm-kms-destroy-fixes-v4-0-242b0a3f8e47@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3385;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iM9tCgrXdMoAc0lpkEnlYv/1Wi0+ANIcrUxdVoj0Zoc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCd2bGB58rqVr8hoJL8BnbuQS4YkuMzpnyL0Cl
 tSINwYNVr6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawndmwAKCRCLPIo+Aiko
 1X1kB/9vKjFh9sbWfnCE0uG58KbQXR/HZIt3VNbJNfmh2xHotRLuCJvPfk/oovco5wLCwpDdbc/
 EZwQPgT/s/O8BdiL/7EuYAEfB6R5i3/qloDBIAwprPX7t4mLS0GkNMloOyEaNOp7toaJYxX9XMG
 Pv0N6kUgVzNnPKLdXgWsnrBMhLlJB2YCcVc36LV+J06r2Y/OFYZKR6TkQTloo05WxWWAhGE9c3z
 +YYPPBJEfbM6ZgOFkcD9004KMDjT1CXYYY3VbH1YYhoEkRSMmOG7QjKXXMBMhboZ5h1pWURUQno
 kV68Ky1yMdhNfmaBS3cIYhmpmKj+yukqpl0Gg/rEh80vBySd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX38W+8dobUl1c
 WHsnSgUzT2GTRkD1AibQj60QkkpBtGnkKH4mpBVU7Wh/7xVu+j2ehxpfhqlg+L83UHcoOoxYZdk
 ox47VCRra7MhvVJnHVVAop37qUN9XnyYlqBeM5JafBdMdezKeGX9QmRk78602PrMaqgK2Vgdvpd
 0ozEG50g+PkjFn79EpyKZWI0YZCEuSSZhABI05cak7iuGcFQ8Qx7zMlKnAwlzHDfZ6LkXIKuUJZ
 YTRS9SK6ETHGNZeCf9KKkxVS7wkwWUL6Lt9DSpsUMsC5fRU6rFQL4+qwzEr/Aa5w/nijCg8Fy8X
 yS+/nZcaefs7lDC0j8yJvr9OPxK5IJEq3HXkjWHFuX3pVbYqAMbvEklqLaHkFHyyAMV/SguIVz9
 5qYnohIDrO9ttdI3qILloCQy48nvzsnFUaVw0gNnRlfpNhPjFJG9kcbVpaWMrZH6tzVVLRYoLNI
 nYpuW2d57LT89KuBxnQ==
X-Proofpoint-ORIG-GUID: tyZN3vLeGMTyzBwHo8uetuqDQYew0qp7
X-Authority-Analysis: v=2.4 cv=QpzLTlyd c=1 sm=1 tr=0 ts=6b09ddbc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=RYZzOHaK-VtI4H7RTV8A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: tyZN3vLeGMTyzBwHo8uetuqDQYew0qp7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX6hD1auPppWG/
 uy3ahd+mbV8lkUuzwWTyX4jy8CHtDGoZbaFw/CL5zn5f7Hth+1A3Q3M853m5blCziTecYMjnpGZ
 gZJyHaMXaW1OAH8j8NuKAKNxe7k6aD4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

The display snapshot work is queued on kms->dump_worker by the IOMMU
fault handler of the KMS and by the DPU interrupt handlers, but neither
of them follows the lifetime of the worker:

 - the fault handler is registered by msm_kms_init_vm() in the middle of
   kms_init() and is never unregistered, so a fault during kms_init(),
   or in the error path of msm_drm_kms_init(), dumps a KMS which is
   still being set up or already being torn down, and a fault after
   msm_drm_kms_uninit() queues the work on a destroyed worker;

 - msm_drm_kms_uninit() destroys the worker before it uninstalls the
   interrupt handlers, so an underrun or a timeout in between queues the
   work on a destroyed worker as well.

Start the sources only once the KMS is fully set up and stop them before
the worker goes away: register the fault handler as the last step of
msm_drm_kms_init(), unregister it first thing in msm_drm_kms_uninit(),
and destroy the worker after the interrupts have been uninstalled but
before the KMS itself, so that the dumps still pending run against an
intact KMS.

A fault during kms_init() therefore no longer produces a dump; the KMS
is not complete enough to describe one at that point. The handler is
cleared with the kms argument left in place, so that a fault handler
already running still gets a valid one.

Fixes: 2ec5b3dc18ba ("drm/msm: add disp snapshot points across dpu driver")
Fixes: eabba31a839a ("drm/msm: register a fault handler for display mmu faults")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index f3e39c3907a9..a94d2888a21e 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -182,8 +182,6 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_de
 	struct drm_gpuvm *vm;
 	struct msm_mmu *mmu;
 	struct device *mdp_dev = dev->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct msm_kms *kms = priv->kms;
 	struct device *iommu_dev;
 
 	/*
@@ -211,8 +209,6 @@ struct drm_gpuvm *msm_kms_init_vm(struct drm_device *dev, struct device *mdss_de
 		return vm;
 	}
 
-	msm_mmu_set_fault_handler(to_msm_vm(vm)->mmu, kms, msm_kms_fault_handler);
-
 	return vm;
 }
 
@@ -245,6 +241,8 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	BUG_ON(!kms);
 
+	msm_mmu_set_fault_handler(to_msm_vm(kms->vm)->mmu, kms, NULL);
+
 	/* We must cancel and cleanup any pending vblank enable/disable
 	 * work before msm_irq_uninstall() to avoid work re-enabling an
 	 * irq after uninstall has disabled it.
@@ -256,12 +254,12 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	drm_kms_helper_poll_fini(ddev);
 
-	msm_disp_snapshot_destroy(ddev);
-
 	pm_runtime_get_sync(dev);
 	msm_irq_uninstall(ddev);
 	pm_runtime_put_sync(dev);
 
+	msm_disp_snapshot_destroy(ddev);
+
 	if (kms && kms->funcs)
 		kms->funcs->destroy(kms);
 }
@@ -339,6 +337,8 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 
 	drm_mode_config_reset(ddev);
 
+	msm_mmu_set_fault_handler(to_msm_vm(kms->vm)->mmu, kms, msm_kms_fault_handler);
+
 	return 0;
 
 err_destroy_event_threads:

-- 
2.47.3

