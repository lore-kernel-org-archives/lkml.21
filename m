Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074406;
	b=PbNXZDMjR0VTiwd40e3uWG50u/Fc6tEMGc18cX8UozwqGDxUiUAkpPCPm/f1yS6Ka+yY
	 FdSqv6o+VRMc4XIuXloIs9lDSlxAuw+DVDr+r70WntWSY0HQygTweEKfXs4j9evBzVnP3
	 Bl+R4bSVee0B63vg5WSHjT3K/ib/oWafgbIjk3oE7TAxgpXDnLVpmKoOzfGSu+WBYJ0FS
	 flMyDFuAu5WwEQ0214UkfZHCG4R247xE4GfzNk/zWpjdLrrOyFFCr98IAte8r3dh4aXKZ
	 yDB6alAUVZZya52E63SoiQi3D9q6phmIRR3fCtEOcT3lL0tHsHgOwes6gUGtfxU4oQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074406;
	h=DMARC-Filter:Received:Received:Subject:From:To:Cc:References:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:Content-Type:
	 Content-Language:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=mY9EYFtlMX/MPL/gDCu7rzWVjhTIcPHK01mhC8Sxd9I=;
	b=ApVk2Vii0q7YrEV4d/t11B+YztDcUugB/MSgK7OiWb89ozRQBprS82RecDk0zbKNVReE
	 Tol4PDq7B6+RR4DoeY2fPmQ8ezPEBuMJD09WlRtRL948NUidiM44Qn1BECDOdzMLFsgMW
	 WTjIPLCAzm7YBHVytvISYpbDp6YbdDTbkC4fii75NZe7DVB2rvw2ELltQ9th943uExmbe
	 rUAMQVdAq2T/TxLhb4ZlgspaWULKrr/I3g6+w6q/X9uOPdWTqZphp7sXSTSMId692bIa9
	 gid1B6NTm/JMgYrQPonDmDgJop+BjETz66+GfnS0IeRKb1LduhD1BX8p58OBo5EA7PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73D6606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 07:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E73D6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxZ7Viqf5qgRMhAA--.1612S3;
	Thu, 19 Nov 2026 15:46:42 +0800 (CST)
Received: from [127.0.0.1] (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxTs9gqf5qMtM1AA--.42306S2;
	Thu, 19 Nov 2026 15:46:41 +0800 (CST)
Subject: Re: [PATCH v2] LoongArch: Fix preemptible warnings in cacheinfo and
 local TLB flush
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261119060503.4114-1-yangtiezhu@loongson.cn>
 <4d58c06e-87a2-f01e-a669-d8bef1dec340@loongson.cn>
Message-ID: <fb963628-3a3a-637a-6836-65001bf369ef@loongson.cn>
Date: Thu, 19 Nov 2026 15:46:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <4d58c06e-87a2-f01e-a669-d8bef1dec340@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowJDxTs9gqf5qMtM1AA--.42306S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr1kCFyDAry3Xr45GF4xKrX_yoW3uFg_Wr
	4fWrn8tw40yr1ay3Z3Kw17XF1YqryUCw40g342kay5WwnrZ3y8GFWkKFnFyw4rJFsYgrs3
	XrWq9r9Ivr4avosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8PC
	zJUUUUU==

On 11/19/26 2:09 PM, Tiezhu Yang wrote:
> On 11/19/26 2:05 PM, Tiezhu Yang wrote:
>> When CONFIG_DEBUG_PREEMPT is enabled on a Non-SMP kernel, calls to
>> smp_processor_id() (including via current_cpu_data) in preemptible
>> contexts trigger many "BUG: using smp_processor_id() in preemptible"
>> warnings during cacheinfo setup and local TLB flushes.

...

> After switching back to get_cpu() / put_cpu() (as in v1), this ASID
> race completely disappears under the exact same test.
> 
> So I think we should keep get_cpu() / put_cpu() in
> local_flush_tlb_{mm,range,page}() (as in v1) to ensure preemption
> safety, especially for UP preemptible kernels.

If you are OK with the above analysis, I will send v3 (same to the
code changes in v1, but need to update the commit message).

Thanks,
Tiezhu

