Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681686;
	b=UF52zwpcL9MHryHSMkr8SyIuOBZIMbStdOC8ri2XCJ0DOegsiP+G2t5b80fRztMkWanI
	 oTbY0Vs4OqaYG1V+izBxESEcehbB/MjpqUPgPyugbPz7UWSLFAz6zJPPTseRpkBiujPXF
	 6rN+gKS09sqMSlcwbcnUOFZQqik/CM4Wo10DIhoJHbzwtj7WyakaIafN/YQmwRrwNKZlE
	 gZo8wrNrIO9ykaJB/YnyXRIr+kOK3wo32jMqF6c/M0NrATaBLNTDgglXEOyCjfFeqLHnW
	 QyxG4Tpy14Knz8iSSl7XM+QifufBW64RRonawWXkyzoLVVwVAz6aoYxv4C8Q42DbUig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ziK1uxgT0N4pJKr51qdZ7M3Xl/fHtbiRKWKZVIb+tYU=;
	b=Rbmy8sc/RVqfOk0JJUR83v2H5QbOOZ2aXyNczVdicv7l+YTrkPi5cuUMRuCG9cE5TEwC
	 TRFzx43Ruc75e0GbeW27qYFdmeYJR0rtOuQZCRm05fdZf4YI2whLYKmIKLnm02xOiXYTy
	 sX8nsU7dPZj6ZaVf8d/HgjJplnEl1YVm62It3dVdzUCasEPeBIW0qz8LzVGFxamXLBLsZ
	 9oPyQlTieXsGAzuX74fLX5+SYlyo0brKpQAm6lmHny4ZiHwy7ewMkfttpUq0Fw6l84rEK
	 T2kddLtS9xQkoiwpf+i8t5udUfwVCbZdrS1aksf6tBhIoYlcOOGSOkw/uW0cvHoYffw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="Xn/600bR";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1CE606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C1CE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Xn/600bR
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e46e449e8so4354980f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 00:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795681684; x=1796286484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ziK1uxgT0N4pJKr51qdZ7M3Xl/fHtbiRKWKZVIb+tYU=;
        b=Xn/600bRMgM3YkK1i/yC+0BJXQTC4wFfRAvR4gLu1a2Q0hhXdFhAYIdH67IkTrhlnp
         hGAajJL4WcEletNhIaxesBH9AdAhL6KcWrmFJPx8hazsK1HdcM8IOiXtbdSPx3f0DLpB
         gIQVLhmSgbyghlR/srM1NpW4mt3fKKzKzMv5MdOqYiVGfDraM2b73apC2UBIJeab6tmA
         sP8VT/Es7M1KhNbUWIvH42EgWs1ca98RX1IFBAH3/b9bm2OEprM/jmLYlopxN0hRrU57
         T4BYy+Hlk2PuqqI29ITJYwBhd/HOA5dT7iA+uR2wSiV/HLRBf/6en4bpfY9qmW7HgL08
         vp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795681684; x=1796286484;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ziK1uxgT0N4pJKr51qdZ7M3Xl/fHtbiRKWKZVIb+tYU=;
        b=CCS/Dd5cfeaO62GgimNCgWUC02KFb0DfZeCbyJTIETJlUqjremywPmrpxmgjOeNYgi
         YiRcwuDDPfghvVBiQcecS8SNqkwt+a1zkwYd4v+UQxID46eGCIHWk2SZzfbp0cOa6bvW
         ZjgxzKii0yqsC6y6Dlljqz29FRpZVMDhVS6kbe7I2FgPKcn7HxWfnT6z33/dSqmKj+TY
         Q/CrmacTYmR7o5SOxgWhN81AB20Sft4ILZCV/XzGCC7YJM9M5h3nOtBzF3D47y3G6oJG
         7ZiK18qwDtiSs4wdqYkWZ11BBr84hastfqywWQqvak6sfLQIqlgU0XAetdDFG+69GJPc
         7/QQ==
X-Forwarded-Encrypted: i=1; AL+hErH+1JNy0/p0yHwB5wWLptFR4vZJA3FUJsx61JhZuN7jBGOvN3TzofPIx/NjniwF4Hh+S9G6VKMmQcaitRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z2tXa4+MqQZ55VKxaoukB7bpim8V809nrl6eKTOzl7n1Fzihi
	rcsOB++FixVsqsNHwoBvq2biAw2bkgWQ2kiWZWUw2px63uAiSWDcfCIW1HPd+/zWTPk=
X-Gm-Gg: AZFdTZeh/hYHhRrtXfCduoPB7Nv1SyCwZ1oGMUxtoKKMTauckzahf2nllys7FSP9xLu
	ujYL8hQfVxK5e2UifRTQw2kWyWHIA/2WW7XZvgb5PyQt2ZyFq41tneToCoQ5BzkBOquklrCIusp
	stbyDQSBFoJaneCqC1fE63k78uxKQPg3IHoWpbZbdOFS4iDak9CE5vo3o2RYefjI5oTafjfsNvq
	rzi1kkipRJ5x6zqWtJy4zPjYdQq5k5eVI02tXYyzeLOdLUAqLJnCDGJmXOSVxiLDuuuQRG5zU69
	VC5mNNfUyVidEeQVBKjSDsT6aSAW6DxK07zyEzoTFn+H8ItiyeakXVO05Encfr8vqRRVV1ShpF3
	dM+RBB8ss05dfVLA8aDF6VMaQN/9gIxF1rAOrPzQM30wAbIaaSDWBw0L+K0okHiEqMvqsjkIRON
	795cH/MZuQXOzq5DSzIvw4Po+bIoNq473dBfrUNr7PdjwREGOZ/PlokrY0tgy35w1rQmTf7SS8o
	Il362OFNg36b1B/7ZlOF3nkyb/TJCb8CJt51zmRnOfuQwMYgNdnPxDjUkVBfFU8OnKGo8z3yX5x
	M/wUeGeSIEOhMfgnw/4uqGmOkgZNVXl0
X-Received: by 2002:a05:6000:2c13:b0:4aa:874c:a1c7 with SMTP id ffacd0b85a97d-4abb86ed79amr37999532f8f.43.1795681684336;
        Thu, 26 Nov 2026 00:28:04 -0800 (PST)
Received: from [192.168.0.20] ([212.21.133.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm38604004f8f.49.2026.11.26.00.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 00:28:03 -0800 (PST)
Message-ID: <8e8bda1f-dbcc-4f24-bc75-0b68bcc1a40c@suse.com>
Date: Thu, 26 Nov 2026 10:28:02 +0200
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
Subject: Re: [RESEND PATCH] x86/devmem: Drop /dev/mem access for confidential
 guests
To: x86@kernel.org
Cc: mhocko@suse.com, kas@kernel.org, ljs@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Vishal Annapurve <vannapurve@google.com>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "Naveen N Rao (AMD)" <naveen@kernel.org>, Pedro Falcato <pfalcato@suse.de>
References: <20261124160025.738362-2-nik.borisov@suse.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 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
In-Reply-To: <20261124160025.738362-2-nik.borisov@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24.11.26 г. 18:00 ч., Nikolay Borisov wrote:
> From: Dan Williams <dan.j.williams@intel.com>
> 
> Nikolay reports that accessing BIOS data (first 1MB of the physical
> address space) via /dev/mem results in a "crash" / terminated VM
> (unhandled SEPT violation). See report [1] for details.
> 
> The cause is ioremap() (via xlate_dev_mem_ptr()) establishes an
> unencrypted mapping where the kernel had established an encrypted
> mapping previously. The CPU enforces mapping consistency with a fault
> upon detecting a mismatch. A similar situation arises with devmem access
> to "unaccepted" confidential memory. In summary, it is fraught to allow
> uncoordinated userspace mapping of confidential memory.
> 
> While there is an existing mitigation to simulate and redirect access to
> the BIOS data area with STRICT_DEVMEM=y, it is insufficient.
> Specifically, STRICT_DEVMEM=y traps read(2) access to the BIOS data
> area, and returns a zeroed buffer.  However, it turns out the kernel
> fails to enforce the same via mmap(2), and a direct mapping is
> established. This is a hole, and unfortunately userspace has learned to
> exploit it [2].
> 
> This means the kernel either needs: a mechanism to ensure consistent
> plus accepted "encrypted" mappings of this /dev/mem mmap() hole, close
> the hole by mapping the zero page in the mmap(2) path, block only BIOS
> data access and let typical STRICT_DEVMEM protect the rest, or disable
> /dev/mem altogether.
> 
> The simplest option for now is arrange for /dev/mem to always behave as
> if lockdown is enabled for confidential guests. Require confidential
> guest userspace to jettison legacy dependencies on /dev/mem similar to
> how other legacy mechanisms are jettisoned for confidential operation.
> Recall that modern methods for BIOS data access are available like
> /sys/firmware/dmi/tables.
> 
> Now, this begs the question what to do with PCI sysfs which allows
> userspace mappings of confidential MMIO with similar mapping consistency
> and acceptance expectations? Here, the existing mitigation of
> IO_STRICT_DEVMEM is likely sufficient. The kernel is expected to use
> request_mem_region() when toggling the state of MMIO. With
> IO_STRICT_DEVMEM that enforces kernel-exclusive access until
> release_mem_region(), i.e. mapping conflicts are prevented.
> 
> Cc: x86@kernel.org
> Cc: Kees Cook <kees@kernel.org>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Vishal Annapurve <vannapurve@google.com>
> Cc: Kirill Shutemov <kirill.shutemov@linux.intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Link: https://sources.debian.org/src/libdebian-installer/0.125/src/system/subarch-x86-linux.c/?hl=113#L93 [2]
> Reported-by: Nikolay Borisov <nik.borisov@suse.com>
> Closes: http://lore.kernel.org/20250318113604.297726-1-nik.borisov@suse.com [1]
> Fixes: 9aa6ea69852c ("x86/tdx: Make pages shared in ioremap()")
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
> Acked-by: Naveen N Rao (AMD) <naveen@kernel.org>
> Tested-by: Naveen N Rao (AMD) <naveen@kernel.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Nikolay Borisov <nik.borisov@suse.com>
> ---
> 
> Resending this with the hope of either getting it accepted or arriving at a consensus
> what exactly is missing so that I can take it from there and eventually get something
> merged. As previously mentioned this results in real problems for confidential
> guests both on TDX as well as SEV-SNP.
> 
>   arch/x86/Kconfig |  4 ++++
>   mm/char-mem.c    | 10 ++++++++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 3159852fd6b3..1490e0019c71 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -901,6 +901,8 @@ config INTEL_TDX_GUEST
>   	depends on X86_X2APIC
>   	depends on EFI_STUB
>   	depends on PARAVIRT
> +	select STRICT_DEVMEM
> +	select IO_STRICT_DEVMEM
>   	select ARCH_HAS_CC_PLATFORM
>   	select X86_MEM_ENCRYPT
>   	select X86_MCE
> @@ -1490,6 +1492,8 @@ config AMD_MEM_ENCRYPT
>   	bool "AMD Secure Memory Encryption (SME) support"
>   	depends on X86_64 && CPU_SUP_AMD
>   	depends on EFI_STUB
> +	select STRICT_DEVMEM
> +	select IO_STRICT_DEVMEM
>   	select DMA_COHERENT_POOL
>   	select ARCH_USE_MEMREMAP_PROT
>   	select INSTRUCTION_DECODER
> diff --git a/mm/char-mem.c b/mm/char-mem.c
> index c5761ddedbd7..5d383befd87d 100644
> --- a/mm/char-mem.c
> +++ b/mm/char-mem.c
> @@ -30,6 +30,7 @@
>   #include <linux/uio.h>
>   #include <linux/uaccess.h>
>   #include <linux/security.h>
> +#include <linux/cc_platform.h>
>   
>   #include "internal.h"
>   
> @@ -609,6 +610,15 @@ static int open_port(struct inode *inode, struct file *filp)
>   	if (rc)
>   		return rc;
>   
> +	/*
> +	 * Enforce encrypted mapping consistency and avoid unaccepted
> +	 * memory conflicts, "lockdown" /dev/mem for confidential
> +	 * guests.
> +	 */
> +	if (IS_ENABLED(CONFIG_STRICT_DEVMEM) &&
> +	    cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
> +		return -EPERM;
> +
>   	if (iminor(inode) != DEVMEM_MINOR)
>   		return 0;
>   

Having taken a 2nd look I think a consensus solution would be if this 
check is moved inside devmem_is_allowed() for x86. That way /dev/mem 
could be opened but reads will simply return -EPERM. That way 
x86-specific checks don't leak into the generic mm code.

> --
> 2.56.0
> 

