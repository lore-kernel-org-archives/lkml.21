Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518811;
	b=JmBe3RD/0nU/ma38MwBfXB4zc5II3JlYO5MgMnjeMafxbh7HbYGPWf5su2v0EF0Z/Fmt
	 1qjSGJi9dcU4+GrFsmir9l8AGCIVDmdZrvsRW+HuoMpCpKkv3yaI7IzAADqpN6gbXpFui
	 sH+iX6I6p0NWi17LEccCHPUKwAQRz3bZvibK3uMaRULeRS84SyueL8gXIskBBdf7yReH5
	 qNdVeyXe87LclSz2W6cFJJ085QAQBVQB8HNs4iFXocMDUVH/8S2rj7zYUwmDpE9ljvNJI
	 EMUdwtO9SmxjAyFiAVWejOGKHXdRXwU0eNN9d6jxuwfZ+RY6zJoFJioTuam5FqroVkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=43yBSSKB2s2lCQSNwP9RzhEdheigc7I5z48lFs86RnU=;
	b=z9xg50QFbfSe6Sq4mPtvQBalhWiB5nHrIJAFIr7tnqyaAb3a5Q8rS6hooBuzEjX6fjS0
	 0P214M5sPNAV1wbxUFxAb3T0lcPvKp6msdyeuc/Moxw6iCA3o+VTeJ1W5Qq2fuQVFrEIH
	 dckCocoj2IrQ2/z2MSsQgsAhDp3FEne/Eecv9v6U21Mvn4bz+ibiVHX3qk4sxlSbMyyMN
	 jJ4D+P5fupsrA6ZU1tvcBb1ONzJvIf0O3CLGOM/CGskcQA++oRTtIFnsbX5ZvXsyBmUHs
	 nstu+U+AS7Wv/bz87NqKMA6ZNJtp3tOIJFbBkor3Ect/vL3xNEBiFhHUL2b12uvg6aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XklhORRD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aHYbrhdN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7710606A327
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7710606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XklhORRD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aHYbrhdN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuhvf1291450
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=43yBSSKB2s2
	lCQSNwP9RzhEdheigc7I5z48lFs86RnU=; b=XklhORRDknF+u5kwFFGUlFzr9yJ
	J7bZM4BjYJ7GU8jEyX7Vo/JAUwwupijkSAyXn9TPAfbUi4hzZ7y/R0Taijgtqon9
	tKxxjb7YEbHtAgyVhYwa7i/VwKwPxS6elZ/YmTRNHF0vU7hEbu8tGaUvftqwGJ6l
	SjqAOd2OzYUP9jLmwgbNgNKx+IZWM6r3zFAk3zB2QxA7jqWgluHUzu0EdLhIpSr+
	b/2zfPjTuRWiom+wCHMwkOWW2PpB8qpsgCzI3tNBxig7GyiKm9SKZKgOi0s0Y80V
	JKa1UjeL/QSz0swnJ95d5tM1JjzDG67RWIGseSprqiMoJNdZtr+7nUApKKA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrbcqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:13:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375bac6bd21so4905442eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795518809; x=1796123609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43yBSSKB2s2lCQSNwP9RzhEdheigc7I5z48lFs86RnU=;
        b=aHYbrhdNxS10UdZM2VVarJyhTFQXGFkstvG4zpCmFLHN92D8x0titCQRxxoe1MfFry
         nX09NrCBKM5Uk4pdfGKcGm679M/2njgoKgYL3FVmDlbEq+M2IzzKuwLdAUhyxw0JzaVp
         nOpzvGGwvLYTRISquDG/7h359tsf1iVcRHNGLOz9q7U0s8pYrud/sBSwJf6fXD7G0HG9
         K1d6DvgIVK3wfl3VsmEMmq23juI42zAYANUDLxLWZ/FebHeXy+YuerCewD6CECut8v3C
         nl6U6ryXB0Zu7bxS74/2Ki6zkYyXmZNprBUmPxYwhUQDuqW1lsvJw7psZ9EZ/g4eUwdM
         3imA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518809; x=1796123609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43yBSSKB2s2lCQSNwP9RzhEdheigc7I5z48lFs86RnU=;
        b=vniTcXdsYkl/jPiyDYpwMQ795xcUU+x4azVnULNFU/XZuedTI4Wl8hnOsZvyhSayLM
         zVcAfTb9OfZ02NoM6EJ/SZbxKbALP61j0vjP6IUhENKAWSS6FqHbeQG+Y5uwF7EDGgXZ
         pFCMLi8L7L/9SKTKsBZm6N5RZNosWTwAsQd1nb/jwztQF3U7HQm9FBazT/Kpi60EPQvY
         Q7qhOkfq7gftlyKy3uPPbE31wnqQtFjnQSY1jPWLfWWYgtmlSZzVo4V/DRoYMXRbo2Oh
         XoNfSRwh4j5ZOeeV7mZuws/LmNEtFyOesRsYSTfmjvTaapunt9L4LcYsvMkUjGh6QNed
         rH+A==
X-Forwarded-Encrypted: i=1; AL+hErFmn4HYNv3a+inl1Q9jmysgF4+YieXrC1+Is7I7oRPL0IBBif8/fSgAagqVbz0ikEt+jLbK15GVbR4aV8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u5S7XfBmmNTKgQ3RUyM5g3c3dRBbUxDdxALPCkD1aQb25ntCI
	9ATEoGfqg6py/0RhupsGDi1Jf/wvIwZB85R0MrfulH5LBd+OkIKt5alYILUbIuRa1r9BLrrIyUb
	rfHIDej4tZghIOj1+9vrjpT+p1VnzyWmzS+f6A8APfvmbH8wthMfJj2op/824tsj2w9g=
X-Gm-Gg: AZFdTZfM62PwzZ4YcKpyXaQ7ceK0+Ji6AWAT0eyHH9H7EYjoMITPfqTBORCj5sJnGhU
	M81dsCeeP2YPQqtuBZVVtISjKkQT/aDaTMVCau2CpzckP5/DNShY/D7nCo2GlpTN3obn7kl1Kup
	4p8dqOoW+c9/LPLJOal6tlV4EbmO51sGVvTriH+7yiXcU4bbEhI3C82WwmUrBC+R2CfMgj6RDpE
	Zt1l/X1lteqcf4kjLAWGJ0EeIakqgLCZ9MnhI6q6WOsFt1Jmj6FBu+FqatjTH0VD6wACN7v106k
	zUJgVQ1F9XjzEKaJoHdirK7wuYDoOpqhsnEqBfOIB74VVEGng/3V45ENctVUpHu0JxmrVYCPk83
	JIpcV9clXOCu7FpZTzu5+4H2w5kp0ppcEYDotdMjW18GLvbZ+K1hAk+o/T9/Y8Lk6lZRm14FtxC
	0hJcb6sw==
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr15881245eec.7.1795518809140;
        Tue, 24 Nov 2026 03:13:29 -0800 (PST)
X-Received: by 2002:a05:693c:6395:20b0:375:6fed:8e71 with SMTP id 5a478bee46e88-384b3986edamr15881213eec.7.1795518808365;
        Tue, 24 Nov 2026 03:13:28 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm43259567eec.15.2026.11.24.03.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:13:28 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, faisal.hassan@oss.qualcomm.com
Subject: [PATCH v3 1/2] usb: dwc3: gadget: fix DMA mapping leak of requests without TRBs
Date: Tue, 24 Nov 2026 16:43:20 +0530
Message-Id: <20261124111321.2731905-2-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MyBTYWx0ZWRfX1CsJkYRIMMNH
 cdOEea1LUMgwc3LSbXuiZLJVDiuIPcbKR1hPVsro2d9SBQL2qqr76moRVraV7ojczgL+wTKPX3F
 eSDFXqMpMg24dz2wv5rjnq05BIaYO0I=
X-Proofpoint-ORIG-GUID: 5QSTJOh0V9yOm43CfHhE1FQmqGnkGQ1-
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b057159 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Q5tkd2OBlz4b3Mc1XJkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MyBTYWx0ZWRfX7ypQZxZZ5KG2
 mrLpvP/d1k/q3VokxQsuzZyzrL0yB/yi/b0HV8CxxZzZvdgatQ6ffrnsha5or5P8TrhilnILBXd
 CXXik0+ZbfIZUfoxYMSoVIXrbUlJ7wTsig7R3g0gPzwNggfyYORbgqBxp3y8Cg1T/3sVZiVyErb
 YgY1fZcpF3bpELnFWMvyUGx0GpHyevTLQ61ROpk7M2i55KAwtM6VIduBf9S9gZH5LdUyDs17opK
 UrZcs9OJdQqH9IInMy4APOKMdAOWRG7max0pd5SMHblpRSb5G3i7J2QYKkZwJK8LhViorjaXPp2
 Ol0gcEYXdMXyR73sZANkp8Kg5vxG8/3Q5EcnpzTKzEzNXr3c4y3VOqaOkV6WSbepNc50UrNPnUw
 B5/rmAGkkpxbmOIKW9s2EnbfjAj5XOrKq3m3eULr0NdMIa/tfGP+1KCrIZlDlPHQzUTajj4JNHr
 8f78xBjnH6lgPo4QlvA==
X-Proofpoint-GUID: 5QSTJOh0V9yOm43CfHhE1FQmqGnkGQ1-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240043

dwc3_prepare_trbs() maps pending requests lazily. A request that needs
more TRBs than are currently free is left on the pending list, mapped
but with req->trb unset, and is mapped again on the next kick.

dwc3_gadget_del_and_unmap_request() only unmaps requests that have
req->trb set, so dequeuing such a request, or failing it on
disconnect, leaks its mapping. With an IOMMU or swiotlb this leaks
IOVA space or bounce buffers.

Track the mapped state in req->mapped, skip the mapping if it is
already done, and unmap unconditionally on giveback.
usb_gadget_unmap_request_by_dev() does nothing for a request that is
not mapped.

Fixes: cdb55b39fab8 ("usb: dwc3: gadget: lazily map requests for DMA")
Cc: stable@vger.kernel.org
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/dwc3/gadget.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index afcbde73fcb7..e4436abd222d 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -203,9 +203,9 @@ static void dwc3_gadget_del_and_unmap_request(struct dwc3_ep *dep,
 	if (req->request.status == -EINPROGRESS)
 		req->request.status = status;
 
-	if (req->trb)
-		usb_gadget_unmap_request_by_dev(dwc->sysdev,
-				&req->request, req->direction);
+	usb_gadget_unmap_request_by_dev(dwc->sysdev, &req->request,
+					req->direction);
+	req->mapped = false;
 
 	req->trb = NULL;
 	trace_dwc3_gadget_giveback(req);
@@ -1659,10 +1659,14 @@ static int dwc3_prepare_trbs(struct dwc3_ep *dep)
 	list_for_each_entry_safe(req, n, &dep->pending_list, list) {
 		struct dwc3	*dwc = dep->dwc;
 
-		ret = usb_gadget_map_request_by_dev(dwc->sysdev, &req->request,
-						    dep->direction);
-		if (ret)
-			return ret;
+		if (!req->mapped) {
+			ret = usb_gadget_map_request_by_dev(dwc->sysdev,
+						&req->request, dep->direction);
+			if (ret)
+				return ret;
+
+			req->mapped = true;
+		}
 
 		req->start_sg		= req->request.sg;
 		req->num_pending_sgs	= req->request.num_mapped_sgs;
-- 
2.34.1

