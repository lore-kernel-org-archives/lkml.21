Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098147;
	b=0jAVfV/eSeIWBvuVCCvZqljAz4DsUMZqvgtexBixu4YZDO6EY6GGjG8mCYF7prRoNZyG
	 vV+U20jPLxXTbKYw2M7NwL1ZUGaFDXakbPEe90xZcRx0uQ+RwmJht5uzloa2K17JqV1O8
	 yBlXSNA7ImIMSGDCwcopWbKiwlkx9cGaHH/cp0q/sMbsnuvYdWaGm74r4/9jJIeLYgo0l
	 SsSpmzy0sKmbVYwfsEFT7ZeUbdYply+G8S4KTn3Jg7T2YIQ3kpqDtQiOZqh4Cgj1Y0obW
	 aZFisk6zsNq5bWyf5UDhMgJpUzPPlHJTx4k9cZ+EmDepM+KuzytGfODPqIB8SnWKTDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098147;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=L6uxwUuqH0f8RWe15GGvzU6g5uqvzLdd9ZSxDK/HVHE=;
	b=zySoEmqZSR+cyOUyuPEoeidQ6avQcnd3IOslAeQWbYcacvMf5pHBbgNVvcC/gWTL23rm
	 A+ywOwYYWvBZpEphgOOgIPU5HHnj0gT8TpMvh9lkyoYoGPlGOPCBLvkXAMn5fE6rF9iuY
	 oiqC/JDJl8KQ3qLJXlWkg66VF1oMLtlqAQLWCSoC8g2b+uo6pYqzkrjNvrSLJeIog7pdT
	 rp5n0d11YySpHPAS8ceYYzeCjHDBC1kDfCsu6fdDz4ubb2wAHJsJER8tYmbktdq+MIx6J
	 qmfLb/x+qagJzUgkslEfV4hO7lq/hcG7VNNsez9KCLPijH3E/suON80dzzeGTIPQfJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Er5st8uM;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813DA606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 813DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Er5st8uM
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBu9ax2870886;
	Thu, 19 Nov 2026 14:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=L6uxwU
	uqH0f8RWe15GGvzU6g5uqvzLdd9ZSxDK/HVHE=; b=Er5st8uMO6KyakxzTI5Y5J
	vMn9BmdZgyD0zFiU/ZJRs3m3j+x/+8uQD4EvOQPW2Ge+r0Yez0FlUCV8e+6IAL2y
	mAVBqKlJRsYeTKGsxoM+NOSx5ypoInWcr4t1ohg82RCwtDKQDg8b6kprQSYWqGsO
	xQQsq+K/DbYq6N7XQFphhMUJs5S24mLEGkhe5Z7tZRq4HwGxjR83ve90C2jC+9dO
	y3N2phiQmCTsjkUdOMoIsQGtea/GQyAeQg2jmdS4MlXB5g0HWvgVttYxGhIyHECg
	mSe2Nlzl5uVLmpECuHvrePLIQJvjXZhrq2B5AVZdWlbbfeQMD7PCgXlK4em28gFg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105w1b7p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 14:22:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBnsKQ2498374;
	Thu, 19 Nov 2026 14:22:06 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j1v9xa3rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 14:22:06 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AJEM5ng29229806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2026 14:22:05 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8570A58056;
	Thu, 19 Nov 2026 14:22:05 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBB655803F;
	Thu, 19 Nov 2026 14:22:02 +0000 (GMT)
Received: from [9.123.7.57] (unknown [9.123.7.57])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Nov 2026 14:22:02 +0000 (GMT)
Message-ID: <4a5c78d9-0125-4289-a18f-858f2cba94d4@linux.ibm.com>
Date: Thu, 19 Nov 2026 19:52:01 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] nvme-multipath: apply delayed_removal_secs changes
 to a pending removal
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261119-bug-nvme-mpath-set-live-srcu-v5-0-e1483e2e447f@linux.dev>
 <20261119-bug-nvme-mpath-set-live-srcu-v5-1-e1483e2e447f@linux.dev>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20261119-bug-nvme-mpath-set-live-srcu-v5-1-e1483e2e447f@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: krzUJwga0iDsmpwtLowX9OQDEqALTH64
X-Authority-Analysis: v=2.4 cv=Z8x5j3RA c=1 sm=1 tr=0 ts=6aff060f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VnNF1IyMAAAA:8
 a=dQmzejK24lZXnngio1EA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: krzUJwga0iDsmpwtLowX9OQDEqALTH64
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1NSBTYWx0ZWRfX4iswC4iqFgoO
 /BNMWnWEjqDOkZdicor2oouCKTeQ9uQS50XHINmO+QE3PFVz9lINY008qEhYa643Pz4uBLruz2d
 +beyGJBn2cnVo+txfDh0RUHzshaSvjg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1NSBTYWx0ZWRfXz7rRNKLWFqeX
 sPNqt6MSunjXvt0YsiiEtlvMFX0qLTRB3587Iw3FyuoNUJ23Znevze8OVkktLKHUL0cWsYSNpdn
 tL38DrILSkUpvBuHDzV5uBoPYpQSs6oegatMQHzB7XXm++m7koll45F7PEYjLKGQzXSeIgpa1Zq
 rzfep7Yb855zJAXiaGo5jAKiDLYrnKKZ7QshHmCb8piA2e1sVpOVg/1jfbiUiPlJ4x6htcqu+rB
 QdI7WIzswI33VGI55qmvGOQRh88AslsNCq+qXkV47h2HKiYo1oS0ke1CF+s1b813zJlKpjxSTJ0
 SNrmIWj8mSxuKa1S5W44EuOPH+YvEKJ4kK9vbbhkTB2Hu1i4cxcWpjR/D9AFLCbs0y/jSwaZ94v
 ZKPP4zy5kYgNsAVmOPM6m/rBIjN13hCVdqHpaV3bAGXUqIuhra1rZ1IWgFmigiXboY+aL7bgpOA
 e/gTeeDb/MIDXR6I0gQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190055

On 11/19/26 4:37 PM, Qiliang Yuan wrote:
> With delayed_removal_secs set, removing the last path of a namespace
> head doesn't delete the head right away. nvme_mpath_remove_disk()
> queues remove_work with the configured delay, and bios submitted in the
> meantime wait on head->requeue_list in case a path comes back.
> 
> A write to delayed_removal_secs only takes effect for removals that
> start later. A removal that is already pending keeps the old delay, so
> clearing the attribute leaves the queued bios waiting until that delay
> expires instead of failing them, and lowering or raising it doesn't
> move the pending removal either.
> 
> Requeue a pending remove_work with the new delay when the attribute is
> written, cancelling it first so that the module reference taken for it
> carries over. Have nvme_init_ns_head() cancel the pending removal
> before it drops subsys->lock rather than after, so that a write to the
> attribute cannot requeue the removal once a path is back.
> 
> With delayed_removal_secs set and no path left, the attribute is
> changed two seconds later and the head is removed after (mean of two
> runs, min-max in parentheses):
> 
>    delay (s)  before (ms)            after (ms)             change
>    30 -> 0    26655 (26537-26772)        8 (8-8)            -99.97%
>    30 -> 5    28298 (28094-28501)     5514 (5510-5517)      -81%
>    10 -> 30    8112 (8106-8117)      30376 (30106-30646)    +274%
> 
> A direct read queued before the 30 -> 0 write fails after:
> 
>    before (ms)            after (ms)   change
>    26607 (26450-26764)    4 (4-4)      -99.98%
> 
> Fixes: 62188639ec160 ("nvme-multipath: introduce delayed removal of the multipath head node")
> Suggested-by: Nilay Shroff<nilay@linux.ibm.com>
> Signed-off-by: Qiliang Yuan<qiliang.yuan@linux.dev>

Looks good to me:

Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
