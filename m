Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196194;
	b=hh4pUvbLxIBibZqmpiGq5DMlmcmPnvtzaMYTmOESoKFqkZcg44BPRsrsRXAcnzJ2ZeyF
	 1QRbnvqn7EsKmkeoISwgRWeDOjb6CneiG3o5qlazuX7sIHxGc5kCaO8YSbGxl5zygV995
	 R58OiCqWDOvVnvMAlgEJWIVKLBkiP9i8c/hJrN4qNkh+n0huGpWEmNnmJkjon3gFojAb6
	 74gjf/7pdKIstgEuYgexbBj3D6Gd0U1h1HV5mtCj/VNPQV25km4+tWWqXAZKihFdXRgZA
	 k9fznj1UpO58AK2rmsJE6N5nmMIlTPq2ySimHd6BEua9ql0Z+azXVMeNxAn6DUfWxNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MBIG+cH50SC/XI9GRr24wIYTEsvXHcPRF7vwZX+zhRc=;
	b=vtbpXjGLcf8P9S6C748+hqvhQWClemt1YHstIs4+CHblmUvpAINY6nlicZMMKZKybbqb
	 d9LWWDFFZ5Su6E5Nms+RAQbf6pmNJM1kl2rfuaMShNXWCaVEebak45eOfKDjs49vb4cuP
	 C+UeC4NZsEJLY3ZUtDHFrOV2PgR9C947XW5Backc/gVCrrEYkoao/GAXQwQ/m4m20zFfc
	 8sfIidaxSmrlnuhg4u5IoVs9TbMHG/J4ugK70HM/oQqmLO806tDNPoqdWYHoqhvs5O1vi
	 j832/GtLA8l3Ibe7+6Ms0fFqyCT+NmL8TX+zgZY1I0xFKjKvDxRX+TO7wET8pTdU2uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TfMruWe8;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E93F606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 17:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E93F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TfMruWe8
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEuTFR1754959;
	Fri, 20 Nov 2026 17:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MBIG+c
	H50SC/XI9GRr24wIYTEsvXHcPRF7vwZX+zhRc=; b=TfMruWe83lvAhJS6sUxaFa
	cRMdDHsPLkbMv7+cArmwdAZ+ib02A6v69FUcvGaVlJpHIqloGaVnzbYD++cxBWiq
	E7Wt1ANaudixtN0Vvu4yh44GHb+ADigL1hT7+Ys7lsYsfIs/aUQUaO7m010nHdyJ
	KZi6X26c+NZb5JQPIx0+7KrYBhjEEWkhmBvThkMrPC1x1a/TSBifT9HJl9DJ9Wk7
	tV0ezkDzilNPwUPsmjW2O8UE7WZIVvxmq7hwADuHiDoIr1K28Gy93GopIyqi41vy
	47Aavb2tWdmqX49FjgUie32MnkuViI5GlqUnaP/7x1eyQIvKBA3ptMvtUs2KBYGw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105s22by-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 17:35:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKEo0Mq1313896;
	Fri, 20 Nov 2026 17:35:51 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j2q5nh4tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Nov 2026 17:35:51 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AKHZo1L3080706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Nov 2026 17:35:50 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B09DB58055;
	Fri, 20 Nov 2026 17:35:50 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64A3E58043;
	Fri, 20 Nov 2026 17:35:48 +0000 (GMT)
Received: from [9.61.150.232] (unknown [9.61.150.232])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Nov 2026 17:35:48 +0000 (GMT)
Message-ID: <70f1a219-05cd-44c5-9d34-b30b00539a93@linux.ibm.com>
Date: Fri, 20 Nov 2026 23:05:46 +0530
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
Subject: Re: [PATCH v6 1/3] nvme-multipath: keep a large delayed_removal_secs
 from wrapping around
To: Qiliang Yuan <qiliang.yuan@linux.dev>, Keith Busch <kbusch@kernel.org>,
        Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261119-bug-nvme-mpath-set-live-srcu-v6-0-da85b18b274b@linux.dev>
 <20261119-bug-nvme-mpath-set-live-srcu-v6-1-da85b18b274b@linux.dev>
Content-Language: en-US
From: Nilay Shroff <nilay@linux.ibm.com>
In-Reply-To: <20261119-bug-nvme-mpath-set-live-srcu-v6-1-da85b18b274b@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1SmBlhJnzNhH5fF6zGWveu-GdHaFFe5u
X-Authority-Analysis: v=2.4 cv=e8uT2qp/ c=1 sm=1 tr=0 ts=6b0084f7 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=46_-i4G4P8Mb9RBiHV4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA2OSBTYWx0ZWRfX991gpPG0Dr0Q
 KqJPg7Udlv38obae9oHV72bDr3j6JFV2MTOlfWw7f8iOEZTOrMqMOELg0EXe0AsGNkoixpOGPEW
 R0eplEOR4KAhBMy0JNA9X3bKzzdzLiM=
X-Proofpoint-ORIG-GUID: 1SmBlhJnzNhH5fF6zGWveu-GdHaFFe5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA2OSBTYWx0ZWRfXzv7QLDSYE3JC
 O7DL/wclV4Rh7RoenEo8jITWcOify9Oi+BHUVNO19MqM6PkpxCieiGvq1CO6iEi2u2nLWBI1HSv
 drI5RL/JxzUlarWMDX6j91uGLmdMzBCpb7pwLvz+j9wU2gLezVBTekEGiehMsAh+mlKRk6J12bS
 bir2nLNzwAz4SICsexrH2c0/Sx6m5bXH+2XYVWY4TJ8xM7a8Y/ODF5CU0M3aLyHLmKpDpRkgbrk
 LHumQucsJj2i9EpTE0ONncZHWC+jyBwiEE3pBni34K4rLA2Xud69QsX7MNwtog+G8i7jCaitNLz
 AJ1fDNSR0C3LnkB00e3N7lG0nSthpLpmonHCqkA+6VOQUlRVU6KV1oSIhuCP4aVseS8qGk5a/Ik
 7pPW5KEXyq+UzXDkFlfQXFmC1KN3Fe8uLEyhm9J34EIUVZ93l0nzZn0PYLBR2bvWuDRrk2JMzug
 ypBUCI24qYLnDqhGhpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200069

On 11/20/26 6:55 AM, Qiliang Yuan wrote:
> nvme_mpath_remove_disk() delays the removal of a namespace head that
> lost its last path by delayed_removal_secs, which it converts to
> jiffies as delayed_removal_secs * HZ.
> 
> delayed_removal_secs is an unsigned int, so the product is computed in
> 32 bits and wraps around for values above UINT_MAX / HZ. With HZ=1000,
> 4294968 seconds turns into a delay of 704 jiffies, and the head goes
> away in under a second instead of after about 50 days.
> 
> Compute the delay in 64 bits and cap it at MAX_JIFFY_OFFSET.
> 
> With delayed_removal_secs set to 4294968 at HZ=1000, removing the last
> path deletes the head after (mean of two runs, min-max in parentheses;
> "> 10000" means it was still there 10 s later):
> 
>    before (ms)     after (ms)
>    858 (856-860)   > 10000
> 
> Fixes: 62188639ec160 ("nvme-multipath: introduce delayed removal of the multipath head node")
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

Looks good to me:

Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
