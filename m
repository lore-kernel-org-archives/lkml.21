Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514929;
	b=CmvJmLkE5qDJ9i+S9ukYO1LwmHW9ksz7LlNQ0ifCIWXQchXkNW96gmdicraIvIEG8G4Y
	 N21wAsfRZtarqRiBuWyW/E5w09EZKgr8gCllJYGadr0Fftt2PBoOU8zV7T1ZbQ4hXCiBM
	 MdtgvPZNah45RpuUV2lujlZ6H6NfijHpYgErigTQ/MkC3EYVIf5OB0A+9QYPqWj/0KxBZ
	 lqkpGHYrHbcbVai6UVGIj1pdn/5voUsf5uwcmSqEkcGTs2zmc5/Gtw+k4UYEMa9cZDp7K
	 YklHLExx4GCc3bApe8bImhG+9wevPrjKDvahdkNXN7vKtyn81pkF0vH7CyX1iAzJk/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514929;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=rzf3/cqvmzHGv3qFSL5QC6mYfqjlWuS+RwxjyMzoNb8=;
	b=KL/ybkHiV6tefRfTDWubiHjcRqGZYMJhIEIVJd2+qGC0Ub0Qn5bHUA7S0Lowua2IHQkt
	 gWmBVLERi42WnHC+FMWfoiaEVz/JF+VSjahvRCZyXLI6VJh/5Oi6wbDo40XoTLyWoqbmQ
	 ht2mC/K1AHZTx2jjAFH5EBgFKX2yz8lNB9pI0XczF171/WRKlTIM+ZQ9fzUcJjP9Py8m1
	 VgdljKwlSoshYPj6Mp6xbb0XDnfmBOO4XtlAWfFB6LSCsK9w6/rrC26JOr/cYTGSzItSc
	 wmU3OxNFlYwAXFAPE/FAvhhES2tthTWKvQKDnrxiDM3rVVueDMCj8RTZFPd8EL94QFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="IR8Cmp/i";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3DA606A695
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B3DA606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=IR8Cmp/i
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33BC8339;
	Tue, 24 Nov 2026 02:08:45 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6A3D3F632;
	Tue, 24 Nov 2026 02:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795514928; bh=vwI/GWBLyLVLTmTN2EUL2154TR5p4FeVvygLq0PiHOU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IR8Cmp/iF3CMKl01+dPH1sFgUvIbQzEGczcmIfbo4wYDkv+0Wn5W2chAQOali2dvB
	 rldSikGgRg6cMBLtnB8NpHz6KtWdbciGwkm3bII1+gNHDr5CVsuNCW/xcfRgxLpWFx
	 mNWAuqCIgeAlBg/WVI0u/CT24AqB+33esgT65JH8=
Message-ID: <6825b01a-3235-4e4f-90f8-9e75646bfd17@arm.com>
Date: Tue, 24 Nov 2026 10:08:41 +0000
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
Subject: Re: [RFC PATCH 1/3] fork,arm,x86,fs/resctrl: Fix stale resource group
 assignment vs copy_process()
To: Reinette Chatre <reinette.chatre@intel.com>, kees@kernel.org,
 mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
 kprateek.nayak@amd.com, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, bp@alien8.de, tglx@linutronix.de,
 dave.hansen@linux.intel.com, tony.luck@intel.com, Dave.Martin@arm.com,
 james.morse@arm.com, babu.moger@amd.com, fustini@kernel.org,
 jedrzej.wasiukiewicz@intel.com
Cc: fenghuay@nvidia.com, peternewman@google.com, yu.c.chen@intel.com,
 x86@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev
References: <cover.1795197419.git.reinette.chatre@intel.com>
 <b2e13da64ca3e41207b5d46fb060bccefaf9fecd.1795197419.git.reinette.chatre@intel.com>
 <17fe3497-b887-4dc1-a8f8-3b647c1880a6@arm.com>
 <307b89b8-7613-46c2-a8a5-f6ecf7d05b25@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <307b89b8-7613-46c2-a8a5-f6ecf7d05b25@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

On 24/11/2026 00:43, Reinette Chatre wrote:
> Hi Ben,
> 
> Thank you very much for taking a look.
> 
> On 11/23/26 6:14 AM, Ben Horgan wrote:
>> On 20/11/2026 18:39, Reinette Chatre wrote:
>>>
>>> - A static inline in include/linux/arm_mpam.h, beside the
>>>   resctrl_arch_*() inlines already there. asm/mpam.h includes
>>>   linux/arm_mpam.h, so the reverse include would be circular and
>>
>> Hmm, the existing include of linux/arm_mpam.h appears to be unnecessary.
> 
> ah, I see. I can include a preparatory patch that removes it.
> 
>> As such, that include can be removed and resctrl_arch_copy_closid_rmid()
>> could be a static inline in include/linux/arm_mpam.h.
> 
> As a follow up, do you prefer include/linux/arm_mpam.h to contain the
> full implementation like below, which is the first access of mpam_partid_pmg
> outside arch/arm64/include/asm/mpam.h:
> 
> static inline void resctrl_arch_copy_closid_rmid(struct task_struct *dst,
> 						 struct task_struct *src)
> {
> 	WRITE_ONCE(task_thread_info(dst)->mpam_partid_pmg, mpam_get_regval(src));
> }
> 
> or, do you prefer to contain all users of mpam_partid_pmg in
> arch/arm64/include/asm/mpam.h and thus instead implement solution as:

Yes. The second option looks best to me.

Thanks,

Ben

> 
> arch/arm64/include/asm/mpam.h:
> static inline void mpam_copy_task_partid_pmg(struct task_struct *dst,
> 					     struct task_struct *src)
> {
> 	WRITE_ONCE(task_thread_info(dst)->mpam_partid_pmg, mpam_get_regval(src));
> }
> 
> include/linux/arm_mpam.h:
> static inline void resctrl_arch_copy_closid_rmid(struct task_struct *dst,
> 						 struct task_struct *src)
> {
> 	mpam_copy_task_partid_pmg(dst, src);
> }
> 
> Reinette

