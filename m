Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111370;
	b=5jJY1mX0rSa15m+86HaaHcO2tzI1QxcR6wmQvY2BoX2jSQntEWV3HVTDr1fCw46tVD/I
	 c4DPyIKWKHv5aETN4q1As84vLxStGi84qaY784nlQ9qEdifXxUWKWMnBIrtyZM+CCXg2f
	 c+TTHjm10h4+zmVeNy917mbKoIbbU81leOdqh3zYtcWLvUnwOiqWgmONO81FtIwXCp+/f
	 RnB9GHaZTV69AKuQmkzAm68OHHvHnVMAvYm7vvhLjUceZhOq+NbKnLXg+pFBVfqe1vH8h
	 DkifYMJrMFs/lRjSh03jHyViM0oddOuDJ8udXLpyNjHFQwFDhfUf6xh5HbEnrmT/GVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111370;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=InfsSwOKE1v6TV2NrfByqErpltfDYpKmhyEWW16r+Go=;
	b=R+iyDKZLTzjybNNcriDzZ6IhtESV8zqwuWOYzplyJ/jhu3RzDs7oc3yxV2/Nlzt/BPGk
	 hOoPZIIkFLU5K3yzZZdB2/K1Z3JeUeDtWZWfS0Gc6GJcFnGTl74j6HPQ93+Gau8ZF5M1O
	 CcNkOIFtqUcE3XkkHpFvgRKp5zHFbwNR1OSe0iK6XkU3abGBFO0TfvlTrXMlZh96lmNWY
	 3XGmmg3ENUcP7T5OeTeP3h2Y6KLtYCOzV49IEsSSlVrKaSysDEjg8GCjU5J5JcWD1JZvp
	 Z9iC3Ub56ZEUcbawUgWbw15inFLNYKkqpdF1M292AuOre1dpKqgMYk4nxpNJKX9mD7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMOasqc2;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9031B606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 18:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9031B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PMOasqc2
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd9d0d40a4so13897a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111369; x=1795716169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=InfsSwOKE1v6TV2NrfByqErpltfDYpKmhyEWW16r+Go=;
        b=PMOasqc2DARXGa1LEVWfrXz7qx9W0NT7g7VwpDv2H0vS3MiwyH6GO5gJlO9GKh4obn
         nqoQ8xCG2kUFTbkzzf8I44XO2fBD5C06M2nAPdiP/Rw9dOjyiiDIb/u1MSqve5HrE2SS
         DfQRVkPaVcv6b4op77gPImvNeP5/hoFXXj3xLc6iVpOrFx1SaLsIcvUpZcIDRudDmdqu
         OTrCDR/t9zfT2Zqn1aVx5r4kMGNwJq+1IX/hLrj7y9G1DNOF9ouy8TOxk6InF+ll4YsF
         D8/n9gnmnc0fWbeP2Lg3sAaHjr1WxSM19quCkqsa7Ou0auZfXZQw0J9Kx9XfQ76RI+ez
         /mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111369; x=1795716169;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=InfsSwOKE1v6TV2NrfByqErpltfDYpKmhyEWW16r+Go=;
        b=E3+xkJPW4KtKm1GuXOJwB3+E7r7D3DZvrwWoFCXBw8iGlhpQEJdhAJKCIpze6guGci
         XxJhr+1yGjykdzQbY93qCQlKksxMyatmmOALxspwbrSK6b7RS1qs0X0ZgMQki0ebOwdl
         WOdtqFZA3PipTFzK9ochbeAODIgC5EwZd+QgpBkOseHUuXAlNuSOiwcfcRJc3SgMw+cg
         4enRGg18iCkk/3GOtqobjQbpLSLWag7KohpLR3c5YiHurKUQxi/nM/S25POj+7SOsaHp
         3lZhMvgWTTUTqxHiPkEVCs0e4DxBlUiNOMGbHHl0etug0ic3/oCqUzthNsYbkklNmqRQ
         CvZA==
X-Forwarded-Encrypted: i=1; AL+hErEhNny55L9lsGKBeyctO+ZsjWc69O65rPGhBXUBcDBXKN7SGAXC21BBQZTqsVoAKc+iUbVccjdhD0O0hJ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CXlYNr4qj9AOKO9irXMAPQFS2iju/bYnhaxRUrfqoGr7O9zG+
	d0EwLYNGKD98seucc9REr4N1id4NN6D5JF2T93t0djkxUhBSf/v8qEHP
X-Gm-Gg: AYBFou2/qTKj1/I39k43QaK7e9AioH46pMGaYcO8PcKEzc+xvf/HaW1fHeQ7sR8Wl6u
	Al6YUn1ck7QWkNvEfDhVoQmYSM1LldVgM7Z5ZMVuK4rM5uGrUpVMn9o+YpGQm5/6pn4UmpNHnm9
	zi6xOu+HTzO6l81rC8kBJRX3TRW8YFPGm/SHXlzUknuEvdU8a2kbmJ1k9q5UqIST4L5x7xm3JVs
	0G/xyQrxOwmrqejYlpKATKIxRTZQxQRisi9MeF/dXKxWeFjtHegiqoqD9vy/a8pEt/ppdDjDc3b
	+ZHQJFSfSByRcnk80KZ6TTiWw+mEa5dP/aF4YaQFaRDmi4fziaHcxLofz+c4MjlChYQF7za5sWF
	HIBFsXraT4ZRHL3rVddFVjyl8RBl+W94/Lf7W8LegAF2I9e8zrqyab4NrflB/DW6IRV4GiJiLOZ
	oJlkqPJ6qfcRvCi/os6R368dOuzIWzLqbWD93VSzGb+51Q3kl4/+V10WH5pW7acgmmuX8pknYf8
	JFoA+r15MvgLDQKLLg3UA1GPgUyJJer304mHALHf7G1JGGs/Zl4aXFmsdFLxqaAT2SFOaJhRfvv
	r9Lsk4aGTgdLZtndo9QgFJwlsvbXOXlAZ9vN+YWw3kqDT/jc8H6PfVKR/8/mgHPxBKK4
X-Received: by 2002:a05:6a00:4c15:b0:8a0:73d7:aa7f with SMTP id d2e1a72fcca58-8c87ca50568mr392685b3a.41.1795111368332;
        Thu, 19 Nov 2026 10:02:48 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b27900sm258038b3a.47.2026.11.19.10.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 10:02:47 -0800 (PST)
Message-ID: <23b033cb-1b98-48cf-a089-4e710dfe3e15@gmail.com>
Date: Fri, 20 Nov 2026 02:02:00 +0800
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
Subject: Re: [PATCH v7 05/10] iommu/riscv: support GSCID and GVMA invalidation
 command
To: fangyu.yu@linux.alibaba.com, gong.shuai@sanechips.com.cn
Cc: alex@ghiti.fr, andrew.jones@linux.dev, anup@brainfault.org,
 aou@eecs.berkeley.edu, atish.patra@linux.dev, baolu.lu@linux.intel.com,
 guoren@kernel.org, iommu@lists.linux.dev, jgg@nvidia.com, jgg@ziepe.ca,
 joerg.roedel@amd.com, joro@8bytes.org, jroedel@suse.de,
 kevin.tian@intel.com, kvm-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 nutty.liu@hotmail.com, palmer@dabbelt.com, pjw@kernel.org,
 robin.murphy@arm.com, skhawaja@google.com, tanchi25@mails.ucas.ac.cn,
 tomasz.jeznach@linux.dev, vasant.hegde@amd.com, will@kernel.org,
 zong.li@sifive.com
References: <20261104092111.119394-1-gong.shuai@sanechips.com.cn>
 <20261104112712.68199-1-fangyu.yu@linux.alibaba.com>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <20261104112712.68199-1-fangyu.yu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/2026 7:27 PM, fangyu.yu@linux.alibaba.com wrote:
>>Hi Fangyu,
>>
>>> From: Zong Li <zong.li@sifive.com>
>>>
>>> This patch adds a ID Allocator for GSCID and a wrap for setting up
>>> GSCID in IOTLB invalidation command.
>>>
>>> Set up iohgatp to enable second stage table and flush stage-2 table if
>>> the GSCID is set.
>>>
>>> The GSCID of domain should be freed when release domain. GSCID will be
>>> allocated for parent domain in nested IOMMU process.
>>>
>>> Signed-off-by: Zong Li <zong.li@sifive.com>
>>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>>> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>>> ---
>>>  drivers/iommu/riscv/iommu-bits.h |  7 ++++
>>>  drivers/iommu/riscv/iommu.c      | 62 ++++++++++++++++++++++++++------
>>>  2 files changed, 58 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/iommu/riscv/iommu-bits.h b/drivers/iommu/riscv/iommu-bits.h
>>> index f2ef9bd3cde9..65d1f2250011 100644
>>> --- a/drivers/iommu/riscv/iommu-bits.h
>>> +++ b/drivers/iommu/riscv/iommu-bits.h
>>> @@ -720,6 +720,13 @@ static inline void riscv_iommu_cmd_inval_vma(struct riscv_iommu_command *cmd)
>>>  	cmd->dword1 = 0;
>>>  }
>>>
>>> +static inline void riscv_iommu_cmd_inval_gvma(struct riscv_iommu_command *cmd)
>>> +{
>>> +	cmd->dword0 = FIELD_PREP(RISCV_IOMMU_CMD0_OPCODE, RISCV_IOMMU_CMD_IOTINVAL_OPCODE) |
>>> +		      FIELD_PREP(RISCV_IOMMU_CMD0_FUNC, RISCV_IOMMU_CMD_IOTINVAL_FUNC_GVMA);
>>> +	cmd->dword1 = 0;
>>> +}
>>> +
>>>  static inline void riscv_iommu_cmd_inval_set_addr(struct riscv_iommu_command *cmd,
>>>  						  u64 addr)
>>>  {
>>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>>> index 918fce4aa8c4..5546dfcd976c 100644
>>> --- a/drivers/iommu/riscv/iommu.c
>>> +++ b/drivers/iommu/riscv/iommu.c
>>> @@ -49,6 +49,10 @@
>>>  static DEFINE_IDA(riscv_iommu_pscids);
>>>  #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
>>>
>>> +/* IOMMU GSCID allocation namespace. */
>>> +static DEFINE_IDA(riscv_iommu_gscids);
>>> +#define RISCV_IOMMU_MAX_GSCID		(BIT(16) - 1)
>>> +
>>>  /* Device resource-managed allocations */
>>>  struct riscv_iommu_devres {
>>>  	void *addr;
>>> @@ -842,6 +846,7 @@ struct riscv_iommu_domain {
>>>  	struct list_head bonds;
>>>  	spinlock_t lock;		/* protect bonds list updates. */
>>>  	int pscid;
>>> +	int gscid;
>>>  };
>>>  PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
>>>
>>> @@ -1004,7 +1009,7 @@ static void riscv_iommu_tlbi_calc(struct riscv_iommu_tlbi *tlbi,
>>>  }
>>>
>>>  static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>>> -					  int pscid,
>>> +					  int pscid, int gscid,
>>>  					  struct riscv_iommu_tlbi *tlbi)
>>>  {
>>>  	bool use_nl = tlbi->non_leaf &&
>>> @@ -1012,8 +1017,13 @@ static void riscv_iommu_iotlb_inval_iommu(struct riscv_iommu_device *iommu,
>>>  	struct riscv_iommu_command cmd;
>>>  	unsigned int i;
>>>
>>> -	riscv_iommu_cmd_inval_vma(&cmd);
>>> -	riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
>>> +	if (gscid) {
>>> +		riscv_iommu_cmd_inval_gvma(&cmd);
>>> +		riscv_iommu_cmd_inval_set_gscid(&cmd, gscid);
>>> +	} else {
>>> +		riscv_iommu_cmd_inval_vma(&cmd);
>>> +		riscv_iommu_cmd_inval_set_pscid(&cmd, pscid);
>>> +	}
>>
>>As I understand it, the same choice is needed in
>>riscv_iommu_bond_unlink().
>>
>>The missing GVMA command does not break anything today, because every
>>caller of bond_unlink() runs iodir_update() just before it, and that
>>already sends the GVMA for the old GSCID. But depending on that
>>ordering seems fragile, and the comment in bond_unlink(), "invalidate
>>all cached entries for domain's PSCID", is no longer true now that we
>>have S2 domains.
>>
> 
> There is no functional issue with the current code, since
> iodir_update() already performs the required invalidation.
> 
> That said, as this series adds S2 domain support,
> bond_unlink() should indeed be updated accordingly.
> Good catch.

Hi Fangyu,

I've included this code in patch 10 of the v3 nested series [1].

BTW, if you have time, would you mind reviewing the nested series?
I'd greatly appreciate your help.

[1] https://lore.kernel.org/linux-riscv/20261119132744.396426-11-gong.shuai@sanechips.com.cn/

Thanks,
Shaui

> 
> Thanks,
> Fangyu
> 
>>The change, if you think it is needed, fits better in the last patch,
>>"iommu/riscv: Add IOTINVAL.GVMA invalidations". I am replying here
>>only because the code is very similar.
>>
>>Thanks,
>>Shuai
>>
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

