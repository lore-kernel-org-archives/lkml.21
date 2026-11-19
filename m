Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076677;
	b=2IYNVv0r7ZYoMeQVL6YzPK6FWmYjShaJcjYVRhJlLbPArGPhN6s4yjDr/C72EaYOCoyO
	 bCCTHvjltyVqnpg+Or2NQxy+11DcwwiBoj2uVzFhgsOPecpKT+9zgYsHEliC2PDcmZHat
	 6PAUaqSvNfx/53pks5VgpBlfzwTmTQzeMQzlXbOZkHOaH+czZ4jwMH8UopHBJMC4UCZlH
	 tR4iAe8Aqb5ATX1ZM4x94hNiBnq0kLXaPxOqjNloFC4m0Ot0PuK5V06oq6PVndz/f2Lap
	 5xWDSSc9+hR4q0v6TzX3+FZ0f+F+kpwkUngLKGyvFjKP0vbJ08JmKjSrcYM8KPu5RyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zehNfsT3TCyyVEk8qW/TbbkeoAupl/HHyaohRC3RLYI=;
	b=yPTi6gX2dEEPTUiUoZRVOLo3qb5tPo5r3wT64+Ir5VJJLE3h8YqPEZkVX74u/xWGGDrZ
	 KSirLrXWyRm/25FnepOtiM2h7KVpZnYEhiGtK8kIrU+TjfJHTDK8Cm0felFN2fJFNAcT9
	 wt5oj/qNKvGI9FOFuGOai6KJvH6zAVn7wdFKLj0U/2fuxCHhuvbLpbsbEuvqCGJqdwVrH
	 e0QWvNA6J5ced9Ft5dIO+EUbVQlzAmaJiklXZ0Ck0i52lnQ1mLc6igpViSdvlgY7GvNXU
	 RCKqHH8LH866iJAixkID5OTALfK19GelYvajjTx2veOz5pFCuZLSjLP877Mj94QPbJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FQC7uooZ;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8747606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8747606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FQC7uooZ
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6uar23470000;
	Thu, 19 Nov 2026 08:24:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=zehNfsT3TCyyVEk8qW/Tb
	bkeoAupl/HHyaohRC3RLYI=; b=FQC7uooZsg7gCxypWpVZcqRzmYy3NOgXUbq7+
	1zk1zlXnvr4Krxm3Qj+NqqixtpT9HObprkGw3vbMmlQ4cNda8cKUY5tRMzGgXXp4
	KA8FsM4RT0OpqH9yaz6+sWiK1IzHwKV5mIs9OFJxndaV4kRvJtLmrn30x4a5yt+i
	qdcGYhjgym7+5hdA6qITnaYSLJ6IApljRD1L9NPZXGggsN+FLra6F6EK6ilxEvsf
	BVh7hizN57gYWgmsfKrP+W0Ht1bJVbxQoWNbQidfZDSu2tifmn1M69Pk+B+xHqiW
	wfanRq9B9TszSA8xlXlE9hIPLNM2jOjnRcS4ToegZ9xSaLBzQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105vqe28-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 08:24:23 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7JvFq2580352;
	Thu, 19 Nov 2026 08:24:23 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4hy2bvpc1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 08:24:23 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AJ8OI1q50528622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2026 08:24:18 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B23132004B;
	Thu, 19 Nov 2026 08:24:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E779F2004F;
	Thu, 19 Nov 2026 08:24:15 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 19 Nov 2026 08:24:15 +0000 (GMT)
Date: Thu, 19 Nov 2026 13:54:15 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, christophe.leroy@csgroup.eu,
        maddy@linux.ibm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
        dakr@kernel.org, johan@kernel.org, sudeep.holla@kernel.org,
        ritesh.list@gmail.com, tim.c.chen@linux.intel.com, yu.c.chen@intel.com
Subject: Re: [PATCH 4/5] powerpc/cacheinfo: Move to generic cacheinfo
Message-ID: <av6yL-zYc6-EZN9S@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20261118163639.890546-1-sshegde@linux.ibm.com>
 <20261118163639.890546-5-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20261118163639.890546-5-sshegde@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: MsrS9KZLFHclpfwTl1pXZlEP-cgi_MXj
X-Authority-Analysis: v=2.4 cv=HL9WhYtv c=1 sm=1 tr=0 ts=6afeb238 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8
 a=zrbdrxZsc2jX65fV5IgA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: Dh7cxDaLQb_9wrllqnDH8kd-RPOTie4D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMSBTYWx0ZWRfX+IzDei4Wy6E8
 giPK7mylvAIOD71fdRxFPiACGfKEDgB4BXarmsh31VtLXyGKALpQ/eXYpV0eP4/hDD31uOG6l9Q
 oYwTnlXWZAQVnDiOHxcdJ8riybjqY96M409Uyk4bgoKRyPaIeu2b8Xy2QE1B9HMqW1/AfGEC9Sr
 i08wvvajrkbblOz1iSHn0SwO+exiJDY3EueMru/cgLcfIHsokxu210jFSvU+eBDJl/KndHJZviW
 V9zGUdeWjrzJcq/D5hj3FgZAyeqwHRKF3LYow5yktu1ZGLaZi1+7CqpMc0U6StBs24OfHgD3KnE
 aqAEVIQ+zhkvvFfusCHrm+lC0bwPwMFvkXUDseCjXE62ejy+Os+g3ymEpMu1elW0QjWAX4tAj/0
 Rrv7omDbtCogDNdotjeGv1khJW1orxqjSXmoQgKtTYi2COuu9/na6tPWQJRZNv9VR9VQ174+pft
 QW7r915zR14u4C+gLVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMSBTYWx0ZWRfX9KNXHBO77vGL
 ioghwsAyeg4ALaLUfPKVa24KqSMHN0d3OavWuOWYz/6wqYTCueQJhTMLvZ7ok38jwzrfeDGXHoI
 TFP89oap4nx+D/VTyg8gA/xzX9eGGgE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190031

* Shrikanth Hegde <sshegde@linux.ibm.com> [2026-11-18 22:06:38]:

> PowerPC maintains an architecture-specific implementation of the CPU
> cache sysfs interface. Replace it with the generic cacheinfo
> infrastructure.
> 
> On a dedicated Power11 LPAR, the generic implementation preserves the
> existing L1 data, L1 instruction, L2 and L3 sizes, associativity, set
> counts and shared CPU maps. The two SMT4 groups continue to appear as
> separate cache instances.
> 
> [Both draft changelog and code are written by LLM]
> Assisted-by: LLM
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> -
> -static void do_subsidiary_caches_debugcheck(struct cache *cache)
> +int cacheinfo_get_arch_id(unsigned int cpu, unsigned int level,
> +			  unsigned int *id)
>  {
> -	WARN_ONCE(cache->level != 1,
> -		  "instantiating cache chain from L%d %s cache for "
> -		  "%pOFP instead of an L1\n", cache->level,
> -		  cache_type_string(cache), cache->ofnode);
> -	WARN_ONCE(!of_node_is_type(cache->ofnode, "cpu"),
> -		  "instantiating cache chain from node %pOFP of type '%s' "
> -		  "instead of a cpu node\n", cache->ofnode,
> -		  of_node_get_device_type(cache->ofnode));
> -}
> +	const struct cpumask *mask = NULL;
>  
> -/*
> - * If sub-groups of threads in a core containing @cpu_id share the
> - * L@level-cache (information obtained via "ibm,thread-groups"
> - * device-tree property), then we identify the group by the first
> - * thread-sibling in the group. We define this to be the group-id.
> - *
> - * In the absence of any thread-group information for L@level-cache,
> - * this function returns -1.
> - */
> -static int get_group_id(unsigned int cpu_id, int level)
> -{
>  	if (has_big_cores && level == 1)
> -		return cpumask_first(per_cpu(thread_group_l1_cache_map,
> -					     cpu_id));
> +		mask = per_cpu(thread_group_l1_cache_map, cpu);
>  	else if (thread_group_shares_l2 && level == 2)
> -		return cpumask_first(per_cpu(thread_group_l2_cache_map,
> -					     cpu_id));
> +		mask = per_cpu(thread_group_l2_cache_map, cpu);
>  	else if (thread_group_shares_l3 && level == 3)
> -		return cpumask_first(per_cpu(thread_group_l3_cache_map,
> -					     cpu_id));
> -	return -1;
> -}
> -
> -static void do_subsidiary_caches(struct cache *cache, unsigned int cpu_id)
> -{
> -	struct device_node *subcache_node;
> -	int level = cache->level;
> +		mask = per_cpu(thread_group_l3_cache_map, cpu);
>  
> -	do_subsidiary_caches_debugcheck(cache);
> +	if (!mask || cpumask_empty(mask))
> +		return -ENOENT;

So if we are here, then we are saying, the generic way of figuring out the
cache-id should work. Guess, we should come here for P7/P8 systems.
Have we tried with a P8 system to see if things work as expected?

-- 
Thanks and Regards
Srikar Dronamraju
