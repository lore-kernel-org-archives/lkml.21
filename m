Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518814;
	b=0LuMMCKOt4Aw4hyP32DXTo+ena86+1iqggGA7+4gahLKiHc0bUtgDByW/vHYzFYGCioG
	 lMvQ3rklTRW2h/zNHYAXkENYDddUOC7DTBXaxoxVHOCCJ0AAOwPDbvrIGle+8mn2Nn2b2
	 gRB9SfMtfuM1SkO69VbsWmP3BpJ/STLhnNmCJc0o+IFo0Hjr1JtjqtZJCva0P5wJoekG2
	 yWseRwAByhUag/YwaQ4u0IDtWbLubFGiuqyaT9EdpsNV5XVOJCQpKSXx+4/qg2FI2gOyc
	 VO23Tu8zZJoosHyEHM+i29r28FGjBw94XpeCpQp424MbYlD66zSjfONRvYn6WXdHGag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z3fdvMh/GmMicR7c9RS+kgP2gDL6Eeov4NKkjEP14m0=;
	b=KZXDp0lKEVMko4BxVIYaTqtnob+83is7etULlVkL7xoQKs6M6Uf68DIvQUntmNw81Aau
	 XU+5lYAU3Km65xqhjs/iAwrwY/dHlA7ad+QJnkbXZt7d/lhJ2cTNmHB7vvnxn0dmVsi0w
	 Qd5/Lshdwx6BnwiLLhfHcfsjBi/V5pPjkaVXVqxyoM5tjVt/IXvQLJinpxswVlRZ5NQvc
	 WBHzyzg2v3KfUMOfF2CPJpJCkKNzYDSb5Xyf0pjn4Vc38+EvyHvaQTgy+QWrvMy7TyGrU
	 UEoJQyNiELMqN3w7NcOPTGEc8DKEaoNFemp+4JaPgXWJXVuflRV/qVQZU8iFF8XAfyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K3jiNqds;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=No80Jn5M;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5CE606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC5CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K3jiNqds;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=No80Jn5M
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuhbi1291451
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=z3fdvMh/GmM
	icR7c9RS+kgP2gDL6Eeov4NKkjEP14m0=; b=K3jiNqdsmXwgT/DVnw1ZhjwVSYo
	ZQNrPYyR7bIiizMTxzRzd24/wDZY8I1P2SK1dU1461sRGonUJoQI7hah9XvfZJzA
	wGhBK+XuR9ULpSCtMiH2Aj2Bgqrzrf8ZiQoBfymiPRQF8NaNjMiB8NIFLiTDI6DS
	765wHo3PDzdsca8vTtE/tvltMZoXOsVdhQMMUHjs3dpxpqvhcQVjc8Qk2AP1AaoI
	PGFChARl7WUiWKm46YbtvOPZ7GXVueBj9S3/5yZ0F0URx+Dt6IOxcXnHEUDfOAwR
	ZmCQwQXU92jAGzJZzd9c4JvlDKMfs64xsI9VRxeQWlb/f3wAMbSTNf9YlDw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrbcqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:13:32 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869accaac2so2573982eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795518812; x=1796123612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3fdvMh/GmMicR7c9RS+kgP2gDL6Eeov4NKkjEP14m0=;
        b=No80Jn5MPhITR+M+jah4u6sQ3SueNFen7BlHACjj0jznLwI3g1w1mWwipBpRDxilRc
         N1xzHOP2BGNqlvHYOQfa2Lg0i7kSCmL0WZCy94O0b2YTD0O3RirmCLAE/Qy9jGvUOZ+D
         UTFz2lMOFUQ7jXQ9fsEsBWuZ8AHk/s7uDlTGAa7oYdZAOvxbkTSWtUgQustrveUWHlhF
         XyQZljimdkOs+/nIZkRY7imLo3/h4kr48SIdvALW+HXeIjKoIMSsjIq1bDodvL09FEvp
         FyER0v47I7rMi4R3DTxp+Pn0BBl76h+HHrLbiflDS8nlSWE7U5cvxuG/USkjJ2hWuOHB
         TSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518812; x=1796123612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z3fdvMh/GmMicR7c9RS+kgP2gDL6Eeov4NKkjEP14m0=;
        b=zK8+ihIN06QW+eHiYyPKouX953s9ybI3VtjX0UJkxXg4Hydh5W2rDrvTnwe9lbW3m8
         canoeDNlccS3YbUdA5Siu+ZI3eL8MDrVvXMhy2Ft2k7Yzz/jIMJusd6PzbQjR6NEwogf
         YI+qyXiu34pbWYxnRBfoJPX35n24Vk0Iceo3rfwNAXVWzMtqQ7jBYcE8HgbTkpkYRQDY
         /0bxkIcJDVr3GGKaUbtuNTRkRGJiWLYrGZ8WXb54txE9LXNi+/aKe9naNxXZgFE4/dg+
         hk6W659zUoSs0ZVQJHA9cCZrqUxdnWCukruP0zaKFoKH/9qCBjSuoUVvCjEL0/sUvt6u
         QmhQ==
X-Forwarded-Encrypted: i=1; AL+hErH32Ofnj6JohwU9PAFSnIUH/Cve9FA3E77PrHIn3lIh96A115wHm53GXyyZwckDiDAwt5hT+APOqYZqAns=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Om3T8mgw3sgYXOG0SEYo5iu+TFICqaC7vFgun53P/D6dSIZQz
	58QOjDXtaM8HNnH8jI8c74BQsidI7s1cTAp6haGjKI7OMpqFvX9PhP0dTSdfIRQLA1R7Ax6zz5m
	NqiyWen91lwD5t1HTSo5cUPnHsBeqEO9UCNqB9O/AP7b38gUjNIa8+gwaiUKU7VScpcI=
X-Gm-Gg: AZFdTZesxpHnkLH/mVfEvlKqcTRrCqxSUU+VJG1YDWL2MSebUhx0BHIoSrx6sLc5wBz
	Tc3oRvz/EHkxuWrcWFkrIkWuzzmCK2ZsIPIJa2QPqgkIPSQOVDW2dRXSGYkqK3zs7XoeOhwPikF
	3BHmEosUHp7nB+fZyY6sprSbSgLDImnoqB4mdwWBgJ3p//EDChluyOQFH06Onnl+zZ0KVCzQIkb
	Udvc0npn+r5s1mMsKJ1i61cl+tOyR7BRFH6WJ8swljcH3N7GfkfEVjL396aJwEUA9U99TQ3LnIC
	nvc76AT0jUFoMvE1nnKk1Avz/FockUBLHSCXZRrGhBPdr3pD/guHB8HRCYby/sBE+/ooIB62hw/
	06Wddmcop3TOGE26hdpEvsODhlucHlh+osjangzQP9D2WX+0J6aJaW+1S5fGBGRswb/CXr4EDDl
	dRAgghgw==
X-Received: by 2002:a05:693c:8084:b0:386:c5d3:72fe with SMTP id 5a478bee46e88-386c5d37550mr982553eec.0.1795518811938;
        Tue, 24 Nov 2026 03:13:31 -0800 (PST)
X-Received: by 2002:a05:693c:8084:b0:386:c5d3:72fe with SMTP id 5a478bee46e88-386c5d37550mr982522eec.0.1795518811143;
        Tue, 24 Nov 2026 03:13:31 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm43259567eec.15.2026.11.24.03.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:13:30 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, faisal.hassan@oss.qualcomm.com
Subject: [PATCH v3 2/2] usb: dwc3: gadget: linearize SG requests that exceed the TRB cache
Date: Tue, 24 Nov 2026 16:43:21 +0530
Message-Id: <20261124111321.2731905-3-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124111321.2731905-1-faisal.hassan@oss.qualcomm.com>
References: <20261006172254.1058992-1-faisal.hassan@oss.qualcomm.com>
 <20261124111321.2731905-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MyBTYWx0ZWRfX/NtPs8xOM6Xf
 1ankuu6JJVkHZq0JNu+4AaLHGSdTnFxCAIS1rxUCIeWNo+SB8C+ndcUuRVhbo764HHq9qRe2YNv
 PbGeBWK0J5HqI/huM5e0Cptdc+sw0lA=
X-Proofpoint-ORIG-GUID: BdWqAxa6zbmBYS4phvBHPQ51Gw_9cxvU
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b05715c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YzzaHiFcxo9TBHxc6r0A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MyBTYWx0ZWRfX5GtPJrwJlEHy
 14fpK4H5OimsYQ5CLjqXGUd9/bUglsUQynnwQnX6s3wJGYDjAE8qfEfjUZyxguQMOK/5owCq0a1
 IQJIgbSalKEU9gchU8OKH0WQhWxqPUZyqLzWAC92ma9Z45/4hfTMF+hzgKvGG7fVNKtvVhC38JP
 S/GpbaQZTDp5CMtOVCUXO/jlH1Qb7jJ7KswdLvJtrlYHxj+2QNyCdv9bUad46is96TGjPAvZch8
 C3KaeuOwtf2YEsNoTQ5V5yqDJTRrDz4tvHhLrjmxTRKxyX9c4Nr+w8k3CvcLVnlZNNGKdPy2fQb
 ZPootR2Frh+Wfh0e9/Orp7hfoOBe6fVUY64IKl/oTQbIvI5oLECPYE1xzwpeJ6MeUx3j0BAQ6Mm
 i3FwkJksz5tt+hNxynu2dMO2inNP75htFtXoGkHXxf1C1wZQateCuoRrqSUIMd3FLI1waivgPze
 xCfl/Sa2ovhwliX0ROg==
X-Proofpoint-GUID: BdWqAxa6zbmBYS4phvBHPQ51Gw_9cxvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240043

The controller prefetches the TRBs of a transfer into an internal cache
that holds DWC_USB3_CACHE_TRBS_PER_TRANSFER entries. Databook 4.2.3.3
requires that the number of chained TRBs needed to construct a single
packet never exceeds (DWC_USB3_CACHE_TRBS_PER_TRANSFER - 1), where the
-1 accounts for the one Link TRB that may be part of the chain when a
transfer wraps the TRB ring. The cache never holds more than 15 TRBs
however the core was configured, so the usable budget is
min(GHWPARAMS4[5:0] - 1, 15) data TRBs per packet.

Each scatter-gather entry of a request is queued as one TRB, so a gadget
function driver that hands down an IN request whose entries are smaller
than MaxPacketSize can exceed that budget with no way of knowing it. On
a SuperSpeed bulk IN endpoint, a 1024-byte request scattered across 16
pages of 64 bytes needs 16 chained TRBs for its single packet, one more
than the controller can cache: the controller never assembles the
packet, the endpoint keeps responding NRDY and the request never
completes. The same request runs fine at High-Speed, where the 512-byte
MaxPacketSize splits it into two packets of 8 TRBs each.

Walk the scatter-gather list of IN requests when they are queued,
counting the TRBs each packet would be built from, and copy the request
into a single contiguous buffer when a packet would exceed the budget.
Doing it at queue time lets a failed allocation or a scatter-gather list
shorter than the request length be returned to the function driver from
usb_ep_queue(), instead of leaving a request on the pending list that can
never be started. The original usb_request fields are restored on
completion, so function drivers stay independent of the controller
limitation.

The host side already applies the equivalent workaround unconditionally
for every dwc3 instance through XHCI_SG_TRB_CACHE_SIZE_QUIRK. A request
that trips this check cannot be transferred at all, so applying the
workaround unconditionally can only turn a stalled endpoint into one
extra copy. That copy is a GFP_ATOMIC allocation of the request length,
which reaches order-4 for a 64 KiB request, but it is only reached by
requests that would otherwise never complete.

Fixes: eeb720fb21d6 ("usb: dwc3: gadget: add support for SG lists")
Cc: stable@vger.kernel.org
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/core.h   |  15 +++++
 drivers/usb/dwc3/gadget.c | 127 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index f635a9fbc151..23717613c4db 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -387,6 +387,7 @@
 #define DWC3_GHWPARAMS3_FSPHY_IFC_ENA		1
 
 /* Global HWPARAMS4 Register */
+#define DWC3_GHWPARAMS4_CACHE_TRBS_PER_TRANSFER(n)	((n) & GENMASK(5, 0))
 #define DWC3_GHWPARAMS4_HIBER_SCRATCHBUFS(n)	(((n) & (0x0f << 13)) >> 13)
 #define DWC3_MAX_HIBER_SCRATCHBUFS		15
 
@@ -715,6 +716,7 @@ struct dwc3_event_buffer {
 #define DWC3_EP_DIRECTION_RX	false
 
 #define DWC3_TRB_NUM		256
+#define DWC3_TRB_CACHE_MAX	15
 
 /**
  * struct dwc3_ep - device side endpoint representation
@@ -959,8 +961,15 @@ struct dwc3_hwparams {
  * @trb: pointer to struct dwc3_trb
  * @trb_dma: DMA address of @trb
  * @num_trbs: number of TRBs used by this request
+ * @sg_trb_cache_buf: temporary linear buffer the scatter-gather list is
+ *			copied into when it exceeds the TRB cache budget
+ * @sg_trb_cache_sg: scatter-gather list replaced by @sg_trb_cache_buf
+ * @sg_trb_cache_num_sgs: number of entries in @sg_trb_cache_sg
+ * @sg_trb_cache_orig_buf: request buffer replaced by @sg_trb_cache_buf
  * @direction: IN or OUT direction flag
  * @mapped: true when request has been dma-mapped
+ * @sg_trb_cache_bounced: true while this request is queued through
+ *			@sg_trb_cache_buf instead of its scatter-gather list
  */
 struct dwc3_request {
 	struct usb_request	request;
@@ -986,8 +995,14 @@ struct dwc3_request {
 
 	unsigned int		num_trbs;
 
+	void			*sg_trb_cache_buf;
+	struct scatterlist	*sg_trb_cache_sg;
+	unsigned int		sg_trb_cache_num_sgs;
+	void			*sg_trb_cache_orig_buf;
+
 	unsigned int		direction:1;
 	unsigned int		mapped:1;
+	unsigned int		sg_trb_cache_bounced:1;
 };
 
 /*
diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index e4436abd222d..cfa603000873 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -191,6 +191,22 @@ static void dwc3_ep_inc_deq(struct dwc3_ep *dep)
 	dwc3_ep_inc_trb(&dep->trb_dequeue);
 }
 
+static void dwc3_gadget_restore_sg_trb_cache_buf(struct dwc3_request *req)
+{
+	if (!req->sg_trb_cache_bounced)
+		return;
+
+	req->request.buf = req->sg_trb_cache_orig_buf;
+	req->request.sg = req->sg_trb_cache_sg;
+	req->request.num_sgs = req->sg_trb_cache_num_sgs;
+	kfree(req->sg_trb_cache_buf);
+	req->sg_trb_cache_buf = NULL;
+	req->sg_trb_cache_sg = NULL;
+	req->sg_trb_cache_num_sgs = 0;
+	req->sg_trb_cache_orig_buf = NULL;
+	req->sg_trb_cache_bounced = false;
+}
+
 static void dwc3_gadget_del_and_unmap_request(struct dwc3_ep *dep,
 		struct dwc3_request *req, int status)
 {
@@ -207,6 +223,8 @@ static void dwc3_gadget_del_and_unmap_request(struct dwc3_ep *dep,
 					req->direction);
 	req->mapped = false;
 
+	dwc3_gadget_restore_sg_trb_cache_buf(req);
+
 	req->trb = NULL;
 	trace_dwc3_gadget_giveback(req);
 
@@ -1503,6 +1521,110 @@ static int dwc3_prepare_last_sg(struct dwc3_ep *dep,
 	return num_trbs;
 }
 
+/*
+ * Each scatter-gather entry is queued as one TRB, so an IN request backed by
+ * entries smaller than MaxPacketSize can need more chained TRBs to construct a
+ * single packet than the controller is able to cache. Databook 4.2.3.3 limits
+ * the chained TRBs a single packet may be built from to
+ * (DWC_USB3_CACHE_TRBS_PER_TRANSFER - 1), where the -1 accounts for the single
+ * Link TRB the controller walks as part of the chain when a transfer wraps the
+ * TRB ring. The cache itself never holds more than DWC3_TRB_CACHE_MAX TRBs, so
+ * clamp the limit for cores built with a larger parameter.
+ *
+ * Walk the scatter-gather list counting the TRBs each packet would be built
+ * from, and report the requests that exceed that budget.
+ */
+static bool dwc3_gadget_sg_trb_cache_limit(struct dwc3_ep *dep,
+		struct dwc3_request *req)
+{
+	struct dwc3 *dwc = dep->dwc;
+	struct scatterlist *sg;
+	unsigned int cache_depth;
+	unsigned int max_trbs;
+	unsigned int maxp;
+	unsigned int fill = 0;
+	unsigned int trbs = 0;
+	int i;
+
+	if (!req->direction || !req->request.num_sgs)
+		return false;
+
+	if (req->request.sg_was_mapped || req->request.length == 0)
+		return false;
+
+	cache_depth = DWC3_GHWPARAMS4_CACHE_TRBS_PER_TRANSFER(dwc->hwparams.hwparams4);
+	if (cache_depth < 2)
+		return false;
+
+	max_trbs = min_t(unsigned int, cache_depth - 1, DWC3_TRB_CACHE_MAX);
+
+	/*
+	 * A list no longer than the budget cannot exceed it, whatever the
+	 * individual entry sizes are.
+	 */
+	if (req->request.num_sgs <= max_trbs)
+		return false;
+
+	maxp = usb_endpoint_maxp(dep->endpoint.desc);
+
+	for_each_sg(req->request.sg, sg, req->request.num_sgs, i) {
+		unsigned int len = sg->length;
+
+		trbs++;
+
+		while (fill + len >= maxp) {
+			len -= maxp - fill;
+			if (trbs > max_trbs)
+				return true;
+
+			fill = 0;
+			trbs = len ? 1 : 0;
+		}
+
+		fill += len;
+	}
+
+	/* The transfer may end with a short packet. */
+	return fill && trbs > max_trbs;
+}
+
+static int dwc3_gadget_linearize_sg_request(struct dwc3_ep *dep,
+		struct dwc3_request *req)
+{
+	void *buf;
+	size_t copied;
+
+	if (!dwc3_gadget_sg_trb_cache_limit(dep, req))
+		return 0;
+
+	buf = kmalloc(req->request.length, GFP_ATOMIC | __GFP_NOWARN);
+	if (!buf)
+		return -ENOMEM;
+
+	copied = sg_pcopy_to_buffer(req->request.sg, req->request.num_sgs,
+			buf, req->request.length, 0);
+	if (copied != req->request.length) {
+		kfree(buf);
+		return -EINVAL;
+	}
+
+	dev_dbg(dep->dwc->dev,
+		"%s: linearize SG request len=%u num_sgs=%u exceeding TRB cache\n",
+		dep->name, req->request.length, req->request.num_sgs);
+
+	req->sg_trb_cache_buf = buf;
+	req->sg_trb_cache_sg = req->request.sg;
+	req->sg_trb_cache_num_sgs = req->request.num_sgs;
+	req->sg_trb_cache_orig_buf = req->request.buf;
+	req->sg_trb_cache_bounced = true;
+
+	req->request.buf = buf;
+	req->request.sg = NULL;
+	req->request.num_sgs = 0;
+
+	return 0;
+}
+
 static int dwc3_prepare_trbs_sg(struct dwc3_ep *dep,
 		struct dwc3_request *req)
 {
@@ -2023,6 +2145,7 @@ static int __dwc3_gadget_start_isoc(struct dwc3_ep *dep)
 static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 {
 	struct dwc3		*dwc = dep->dwc;
+	int			ret;
 
 	if (!(dep->flags & DWC3_EP_ENABLED) || !dep->endpoint.desc ||
 	    !dwc->pullups_connected || !dwc->connected) {
@@ -2040,6 +2163,10 @@ static int __dwc3_gadget_ep_queue(struct dwc3_ep *dep, struct dwc3_request *req)
 				dep->name, &req->request))
 		return -EINVAL;
 
+	ret = dwc3_gadget_linearize_sg_request(dep, req);
+	if (ret)
+		return ret;
+
 	pm_runtime_get(dwc->dev);
 
 	req->request.actual	= 0;
-- 
2.34.1

