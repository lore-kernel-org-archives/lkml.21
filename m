Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437196;
	b=CI4+9MVNc0CzKY2+D1gCNhWFarViSLO6mih+n3+cpi/q3UUNGIoQHfCEDn1Vhj/1J70v
	 BOL37ryNfzsqvTynLnW9rZVfIRzK8ppJjvewtOkaNs5Cbp3ggmCGZn7SFtNdnPsq1U73a
	 X9iYJam2mTec8XXMZ2h4bMH0WhR8qbV1z0SajIy5NPj9mb4IEUbDp93q+T7HYRot5Ugq1
	 L9G4m9+ktg/9/fr5iWBqI+2ZEYWfUKHNR9qnYloQqqfHaWc8k1/xxC2sjX1Oavvdb+2HT
	 +6Ry4w7LGRmDgmb8LDEGBKoezp53Nu0fJhhJIRorB8SnV4ENzSyKs8GKklp58Dl7esg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Hn7QLnatls3YJLh9hvARkpylGvnCInTwrPxLQjvpHck=;
	b=2+DJcH/fOk5Qi9EmMuVnuIstNCPubnk7R29gL3/i7OcHvIlZeYgFoQ+8K7WTTIOITIOQ
	 cpvJaXwbdmhflBeHAYdy9thyOXROKL9vbrAEMz+1T7oht0lapyuRmThN9bEgP+vH9Ynx5
	 9MQVb4yfhke5ODFnbssASB0sTREDVI1sFzyk1eV3DzuuzeHMad6FfZ6p0kQy2dGVnoZIv
	 BPboNfHUJMpuF0sV8ws4Yq9d3/IKq7U+4wqmqJnPXpfvyJq2W2vJGKXwxCULb0llZiD6w
	 UzI98i4tBNyiIkSOMdKYpKYBFApd4d/p5AOgSbCcopROtP0M5hzQ3QyNijL8W3HXHZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w0sKEFMU;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15210606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15210606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w0sKEFMU
Received: by mail-pj2-f5.google.com with SMTP id 98e67ed59e1d1-3b411059cd2so728577a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437195; x=1796041995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hn7QLnatls3YJLh9hvARkpylGvnCInTwrPxLQjvpHck=;
        b=w0sKEFMU+eaG9tWtdrJg66TGM2vOfSgYBXGN/RT18135qMoZytktIisMy13P9sdgdZ
         MmnDhx6FBcBKvrXLWbIRrhrRP05nQj6TXfQ3A928lxHhbqYIY6w1XayAgPI0pwYJkvOF
         j99uhIwSqxS2yvq/a8e1N0R1X7IySSi9XfN03R33ucwJGD5kUQyVu57yAv9bZ15ZuBbT
         Pf1YZz296rAeJqDnJdPnQySNvePN3LpefZdTWU+dWREBerrB3Z930oUuJ2hmHRwhrUlW
         EnScyeYoQ/i7vUwix4ZiZeYpFGyD5sWoIrEFnZLJ63hwMcbKnjJaVdMgDuSv0uwDNhh2
         dchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437195; x=1796041995;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hn7QLnatls3YJLh9hvARkpylGvnCInTwrPxLQjvpHck=;
        b=B6OyWNYBiuc548/SXbpjZOZimvDAt38v2v93vgFJk+jqG7rmyp1nuVfjPNqGObxe0F
         guzldsZ09DNTeA5lwXLfnGEX1b7eHCvhdjOSlgMeTnLB5xMHmdrQQnrzo+E92T7Cb7LG
         IILFoRfqDSQwjI6IVBosHVIBkCuh5P8oGsNSqRABMVPwpOO7BkgO8tQpRmO9LfGKit1l
         l81nw7p+KZ3Zm0mFxvq3JQHC3X6FUwSX8sJGBiia9RtHQiF06XHqe8q2D4bfnItcN/r2
         nUEKQ6WP6QJG715INR0lq6IjJqI5LXg2PhG+hA1zfDRiijR+S0ovDOZtJQL5kcDqaijl
         PQNA==
X-Forwarded-Encrypted: i=1; AL+hErERbsekt77m5AVWWVb51VPUbniL2EKzl7GC+8TqNexR+074Tavkb+5/+x5hhCgCGlUL1TrWq8O69F11y5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OCsp5wjUyzKLjexQauiOHbl1vUQUq0z+FaBNFnNXYJ548GImQ
	kSQcV0SHqqCOMWnfiSKzhJnGlrhgjNHbWbda8vPBpjoRbE846vmS3RpTaScEDKoPMiL4ulQOsdE
	=
X-Gm-Gg: AZFdTZdE58DPrCp4u0DNe1OMYakTSld0rn6zK4257ffRkj+E32avTd22k8Qf6ceapjx
	OLHblP53VkCU4I+dHjA/SeLqyOGvf6turp3J0P/nKT+uBdcz9tVKYrwVsn0rVl46djjSUy7sF2X
	GhA69OW9hEovzhxM63Oi9+Vb7dYuzwzF8+wndVzOnmVjeqK/HNMKN7oaiNL50hqb+blR06o/Rb1
	NeJi/+1x0E5KGIleJ6ACtSWrwjbUGvLs/JKgjVMxTsQ3I32AKt1YSKwSOSLHrlhyGoZ54/6bOeb
	uPwfKmlafmhcZrSDYDLNYz7oOapZcRWKUqyU1K3a89by2806bGorYEPjEiO9RrIKtqytxl5k4DO
	s9Zk0WADjZt6ZIgS+16bvWgBb+FOEc+yeP/1xo9qiTcPs/FyYpQPVyqMGpXy0XKoQzraxg3/1b8
	xoFQ7zis5wGReZmixDkQ9rtpbxVV5gLtNl91G+Xc6EDhnG+EdVjhFPT0evOI2yDuNmELuSeqD7S
	7dtWiPQyXiNU5CDn/DkYd4laJiRaiznO5dmb3dYKu/Av0pGbrRCAAH585e72TDbCvprEIT87+N9
	YDCGoCOsu3Z/0XJis9mFoVLUH73L0LRTqJ7hTssOD34lTih9
X-Received: by 2002:a17:90b:268f:b0:3b3:afdc:2e5 with SMTP id 98e67ed59e1d1-3b41c9cf56bmr7964160a91.30.1795437195128;
        Mon, 23 Nov 2026 04:33:15 -0800 (PST)
Received: from [192.168.50.100] ([114.252.97.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm7472471a91.0.2026.11.23.04.33.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:33:14 -0800 (PST)
Message-ID: <4ac66d3b-7343-4ff8-8ebe-d3bf9ab25da4@gmail.com>
Date: Mon, 23 Nov 2026 20:33:04 +0800
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
Subject: Re: [RFC PATCH v3 05/10] iommu/riscv: Add nested domain allocation
To: Andrew Jones <andrew.jones@linux.dev>,
 Gong Shuai <gong.shuai@sanechips.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Tomasz Jeznach <tomasz.jeznach@linux.dev>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Kevin Tian <kevin.tian@intel.com>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Fangyu Yu <fangyu.yu@linux.alibaba.com>, Tan Chi
 <tanchi25@mails.ucas.ac.cn>, Wu Fei <wu.fei9@sanechips.com.cn>,
 Zhao Qingye <zhao.qingye@sanechips.com.cn>
References: <20261119132744.396426-1-gong.shuai@sanechips.com.cn>
 <20261119132744.396426-6-gong.shuai@sanechips.com.cn> <awGP5H2JdjxW8WXG@orel>
From: Gong Shuai <gsh517025@gmail.com>
In-Reply-To: <awGP5H2JdjxW8WXG@orel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 11/21/2026 8:37 PM, Andrew Jones wrote:
> On Thu, Nov 19, 2026 at 09:27:39PM +0800, Gong Shuai wrote:
>> From: Wu Fei <wu.fei9@sanechips.com.cn>
>> 
>> A nested domain describes two-stage translation through guest and
>> host page tables. Iommufd exposes this domain as a nested hwpt.
>> 
>> User space needs to provide the guest stage 1 configuration when
>> allocating a nested hwpt. Validate the configuration before storing
>> it for use in a physical device context.
>> 
>> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
>> Co-developed-by: Gong Shuai <gong.shuai@sanechips.com.cn>
>> Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
>> ---
>>  drivers/iommu/riscv/iommu.c | 153 ++++++++++++++++++++++++++++++++++++
>>  1 file changed, 153 insertions(+)
>> 
>> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
>> index f2305b953f71..4f8ce579ef08 100644
>> --- a/drivers/iommu/riscv/iommu.c
>> +++ b/drivers/iommu/riscv/iommu.c
>> @@ -1698,8 +1698,161 @@ static void riscv_viommu_destroy(struct iommufd_viommu *viommu)
>>  	ida_free(&riscv_iommu_gscids, rv_viommu->gscid);
>>  }
>>  
>> +struct riscv_iommu_nested_domain {
>> +	struct iommu_domain domain;
>> +	struct riscv_viommu *viommu;
>> +
>> +	u64 tc;
>> +	u64 ta;
>> +	u64 iosatp;
>> +};
>> +
>> +#define to_riscv_iommu_nested_domain(domain) \
>> +	container_of(domain, struct riscv_iommu_nested_domain, domain)
>> +
> 
> Please rename the macro parameter so it doesn't collide with the domain
> member name, otherwise macro expansion replaces the member name too.

Thanks for catching this, silly mistake on my part:)
I'll rename it in the next version.

Best regards,
Shuai

> 
> Thanks,
> drew
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

