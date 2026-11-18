Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795025162;
	b=j1L2SnTDiG8ZAqO46at1YzrWJGoVPrRS9gwholoAkUsfPd3QM4dKo9/fBt97Pj8BAGNd
	 h0O9X3pqe5iv2AFdM8iKB4aXRk0aSRqMq31+c2DECDDPRgcKeXA3BMp/rIyIkjl0JZiZC
	 IZPwKye5oqB0Di1A4El5R7D0azUvY92w/um6LKBVP8wJJTyCVVL73LAsAKo4FLltxDsBg
	 X0Lq4p5YspHJEhcRFjqknIiiUsTPwNcvM9QNu6kE2cUoStMtSTKNKQog/p373YRGkYGrD
	 kNzTRboKbshvJ/0w0xCP32kVzbW+MRQFGKPOI6r50xmepkuSRZexgB2a102IeYXmS9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795025162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rWvQ3bfeFQ3gYuvZj5vnEetlMqJHwk+wlW+zezer+/k=;
	b=SZ1P22lEDPSfGB6+guC3hs/77tFSXFLhk1+uqlxCYMCkx5SeTkS3Rry+eXc3yEurrQ3C
	 k8gzeQqAtzGjYtXVO6zFdf7Nj0OI5QPQBM6edpWBGGJSsbwEWNh2Ug6hxNDYuLl2jEqfv
	 KetN1Bl0sqJMzJAajd2yIyLDNBcHeNYlw+oR4M4USbi01UUdysru3ThXTsJQ0OvKiY/T/
	 dYqWAIuAaXmMFkLIH7nGeiscj+Mnl9ofM3/WJmoA1iH5xqqWqOT52ioJcoBG+VeCPigx/
	 HO9N37usa2POE1dSLzJK7phBdMJFNVv7xcn1Sy9bwExlvBdd+G9NeQgnUt+OJPlE1kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oqyoMYG+;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA91606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEA91606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oqyoMYG+
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHPufr077419;
	Wed, 18 Nov 2026 18:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rWvQ3b
	feFQ3gYuvZj5vnEetlMqJHwk+wlW+zezer+/k=; b=oqyoMYG+lgnfBNwH5PLWh9
	OHk8lbNFW4f5fUH0UXldYZtIU9qbDRrJMKqR1RRG99elPFsQh8MstiBrBjQYvDWo
	yJQowq1KUw9ya0qG1YJ0/HRPfEm6VaUocLy3OhjmEGqgyUJlkDXuhv2EuTrOIwwa
	oQRgTnImryz7TbUPOgzaUhBx1gODLSjQSrRkBH/Vu3V13JHmYaUp/cTUXBXwdVBn
	Km8mpH0Cye8vQYO80yAhErS1pyb01oXxKuzLY2gnIqmXGWjMKbYQv+X1nZCuKnwU
	OxG4rNbRUWv3cU4JNbRMl5p1RNQN2c2/aIB8m4ul+SCkAAUxHujmpSt2l75pLjxg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105rkwg6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 18:05:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHK22h1223884;
	Wed, 18 Nov 2026 18:05:32 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j067ngwag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 18:05:32 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AII5Vi429229614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2026 18:05:32 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9809658054;
	Wed, 18 Nov 2026 18:05:31 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B3EB5805A;
	Wed, 18 Nov 2026 18:05:29 +0000 (GMT)
Received: from [9.61.99.215] (unknown [9.61.99.215])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Nov 2026 18:05:28 +0000 (GMT)
Message-ID: <569825a4-3bf0-4601-8732-73d03e2b01da@linux.ibm.com>
Date: Wed, 18 Nov 2026 23:35:27 +0530
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
Subject: Re: [PATCH v4 1/2] nvme-multipath: apply delayed_removal_secs changes
 to a pending removal
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261118-bug-nvme-mpath-set-live-srcu-v4-0-21f368376c8c@linux.dev>
 <20261118-bug-nvme-mpath-set-live-srcu-v4-1-21f368376c8c@linux.dev>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20261118-bug-nvme-mpath-set-live-srcu-v4-1-21f368376c8c@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RNMLemAdn4gq6UEjCYeJCfIwyW_4kPtm
X-Authority-Analysis: v=2.4 cv=e8uT2qp/ c=1 sm=1 tr=0 ts=6afde8ed cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=D3BeKeDXJb-pPu9aK9IA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3MSBTYWx0ZWRfXwigfsOPJyR1Y
 z0lle3RdLTFpBvjyaxTAKcDqN/VGUe5ofAKt465lTnMvQV08UVnNSPr9EghUeSv7+39j965Uezr
 H352rntxsBaXUz9iBUifG5Vwjp9w9EY=
X-Proofpoint-ORIG-GUID: RNMLemAdn4gq6UEjCYeJCfIwyW_4kPtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3MSBTYWx0ZWRfXwt8AjxY2/TKw
 BOhHcNJwPHl8Oclt7DD7c42zraXjZAKGBOCGP9SKybgqfkzgmb25l37aiqBcPb1drR/3CsIjcOv
 9Lf+QFlcq8/0UV5OYyapm1l9pj+AOdHx06Dc0HF5jpoz/S9YDWsCVXCXn8Vpq8+zJEOaL0Q83It
 5CjIPqLjv3mMJEkhTft4F/iJ+hrPSM/SsOZ2T2gowT+LzOQTGqdFd+af0eCASNMOdeilDBOXiiO
 9yyJyKExkLso5zE1Y+TUii/g+oIuCGWl0OjEUSJy8OvdrGfCHDi9rNho1D4T2M9rieStY/1Bk8r
 RdAcOzoRnhly1kf68nmXa0ttHTYpGJKvesc9Ocsxs5Ymj0JAS1JmrwlvKbWu0NKXerKuQ6qR9Mo
 vs7EIsyiEvs26lYz+IHffffgCExLd2d60ANcqn/0xToNmuewZRPsFqcuXeI4Cr6hjkpHO6YK/es
 pmSFBs3fjlaSq/RVhHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180071

On 11/18/26 9:09 PM, Qiliang Yuan wrote:
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
> written. Cancel it first so that the module reference taken for it
> carries over, as nvme_init_ns_head() does when a path comes back. If a
> path is already back and nvme_init_ns_head() hasn't cancelled the work
> yet, drop that reference instead of requeueing the work.
> 
> With delayed_removal_secs set and no path left, the attribute is
> changed two seconds later and the head is removed after (mean of two
> runs, min-max in parentheses):
> 
>    delay (s)  before (ms)            after (ms)             change
>    30 -> 0    26877 (26327-27426)        9 (8-10)           -99.97%
>    30 -> 5    27987 (27464-28509)     5248 (5193-5302)      -81%
>    10 -> 30    8152 (8095-8209)      30106 (30080-30132)    +269%
> 
> A direct read queued before the 30 -> 0 write fails after:
> 
>    before (ms)            after (ms)   change
>    26801 (26243-27358)    6 (4-8)      -99.98%
> 
> Fixes: 62188639ec160 ("nvme-multipath: introduce delayed removal of the multipath head node")
> Suggested-by: Nilay Shroff <nilay@linux.ibm.com>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> ---
>   drivers/nvme/host/multipath.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
> index ae8059366b57d..881d8a0145255 100644
> --- a/drivers/nvme/host/multipath.c
> +++ b/drivers/nvme/host/multipath.c
> @@ -1242,6 +1242,17 @@ static ssize_t delayed_removal_secs_store(struct device *dev,
>   	mutex_lock(&head->subsys->lock);
>   	head->delayed_removal_secs = sec;
>   	assign_bit(NVME_NSHEAD_QUEUE_IF_NO_PATH, &head->flags, sec);
> +	/*
> +	 * Apply the new delay to a removal that is still pending. If a path
> +	 * came back and nvme_init_ns_head() hasn't cancelled the removal yet,
> +	 * cancel it here and drop the module reference it held.
> +	 */
> +	if (cancel_delayed_work(&head->remove_work)) {
> +		if (list_empty(&head->list))
> +			queue_delayed_work(nvme_wq, &head->remove_work, sec * HZ);
> +		else
> +			module_put(THIS_MODULE);
> +	}
>   	mutex_unlock(&head->subsys->lock);
>   	/*
>   	 * Ensure that update to NVME_NSHEAD_QUEUE_IF_NO_PATH is seen
> 
The above change works and fixes the race which sashiko reported.
However, I think moving the cancel_delayed_work() check in
nvme_init_ns_head() under head->subsys->lock is more intuitive.

With that change, delayed_removal_secs_store() can always requeue
successfully cancelled work:

if (cancel_delayed_work(&head->remove_work))
     queue_delayed_work(nvme_wq, &head->remove_work, sec * HZ);

And nvme_init_ns_head() would then become:

mutex_lock(&ctrl->subsys->lock);
...
...
list_add_tail_rcu(&ns->siblings, &head->list);
ns->head = head;

#ifdef CONFIG_NVME_MULTIPATH
if (cancel_delayed_work(&head->remove_work))
	module_put(THIS_MODULE);
#endif
mutex_unlock(&ctrl->subsys->lock);

This way, path addition and delayed-work cancellation are serialized
with updates to delayed_removal_secs_store() through head->subsys->lock.
Consequently, we can eliminate the list_empty() check and the
module_put() from delayed_removal_secs_store().

Thanks,
--Nilay


