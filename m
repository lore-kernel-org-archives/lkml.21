Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193145;
	b=e3phFnhsVLvhYegy9nfzcA4rlWLgP9bjySr6H0ZrnFhL7Qvslorq1weonz3JUkMAzm1b
	 j6GjGp/llAZ5/A+Rv+EGPd/SCXTQUNb5Ms1oL1X4iQmEIZHFgDCnLaSfM/Xg1Ih/K+N/8
	 DIKoBCwGeD04dg0rly6AkzdixPOx49wR9KTeDEU0nOlpJ/TUYCt+ZCfG4kkaqBWp7g9gM
	 vVBY/IUdI3hZxvOGvbFHpzxbNS5gQhKaFelE3LW5l4Oow52fmazpODpg9z/Cwjuyy++yD
	 SiVZJACgcm0Wkog5UeflBUsdPR1J0DUANIU76LctnV7tioqN83P6OtVOfoMXBT8JJBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193145;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=oJiwN8tGAlnmI6izEwwnBlQgNh5Znrop7SXEwLhYgzE=;
	b=pKQge5dGUhlim7KPCfu6A8Fq1q/DkeGqVqAbXBxWCatOINPX/LYCGYVBOWeIDqaLAFe6
	 odBBXEkSLQr4zh+a8mrCkKqyaGdpzIcS/Gg5YS3Hhv5l0WPYdXQXDeW+OWPGCMjF133lO
	 F03OhsUAxXLCM2iJInxRrxXDkBujYLX/AF6q6S7IozajJX80gN32XS80emiO158kMO5xu
	 i0xg+bNN/9Hm+jfwVEmP0Bt9hoihyCTuNccYesZE+r6qwDIRg1dfUu+dxEFzMQcqlbbFS
	 zYebTSKQ3CRGh0oIteoEfbVl4yWHVx0PdwSlnL7eqJeEbp1Q2hw/Dm5egPDUqx+WcKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="D/jzBPPB";
	arc=none smtp.remote-ip=95.215.58.107
Received: from mta1.migadu.com (out-107.mta1.migadu.com [95.215.58.107])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378FE606A33E
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 16:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378FE606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=D/jzBPPB
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YDYRuiqu28FARVRycYUTo1yCu3WrQdKNTM4EinGTQu4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795193142; v=1; x=1795797942;
 b=D/jzBPPB4R/Vf5z+uNtQHDZPTOUw/6W2EP5jbuogSSeWarhuFyzkcK+VbeEC6J4dcLh7wMn2
 qJCmUmJLOn3DHSI6nPPTPA7Tb9uzl9PD+NZ0eSwFTsaIdSi4AjY1ZXwPDgGMQ0vlzVoY7XIVqhk
 mEsRv7+TA1tSJYx0lUdys1Xg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 41424811bc9a0852;
	Fri, 20 Nov 2026 16:45:39 +0000
X-Mizu-Trace-ID: 41424811bc9a0852
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 17:45:09 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Koichiro Den <den@valinux.co.jp>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bingyu Xian <shanbeeyoo@gmail.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] RISC-V: KVM: Skip steal-time updates when run_delay
 is unchanged
Message-ID: <awB4BxCHBu6nacbO@orel>
References: <20261118062242.2914385-1-den@valinux.co.jp>
 <20261118062242.2914385-3-den@valinux.co.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118062242.2914385-3-den@valinux.co.jp>

On Wed, Nov 18, 2026 at 03:22:42PM +0900, Koichiro Den wrote:
> Check run_delay against last_steal and skip the update if they match.
> This avoids accessing the SBI STA shared structure and marking its page
> dirty on vCPU loads with no new steal time to report.
> 
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
>  arch/riscv/kvm/vcpu_sbi_sta.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index cfc6f22c3e33..8b2499876fb4 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -31,7 +31,7 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
>  	__le32 sequence_le;
>  	__le64 steal_le;
>  	u32 sequence;
> -	u64 steal;
> +	u64 steal, run_delay;
>  	unsigned long hva;
>  	bool dirty = false, success = false;
>  	gfn_t gfn;
> @@ -52,6 +52,10 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
>  		return;
>  	}
>  
> +	run_delay = READ_ONCE(current->sched_info.run_delay);
> +	if (run_delay == last_steal)
> +		return;
> +

If we move the new check to just below the 'if (shmem == INVALID_GPA)'
check then we also avoid a memslot lookup.

>  	st = (struct sbi_sta_struct __user *)(hva + offset_in_page(shmem));
>  	might_fault();
>  	if (WARN_ON(!user_access_begin(st, sizeof(*st))))
> @@ -66,7 +70,7 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
>  	smp_wmb();
>  	unsafe_get_user(steal_le, &st->steal, update_sequence);
>  	steal = le64_to_cpu(steal_le);
> -	vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
> +	vcpu->arch.sta.last_steal = run_delay;
>  	steal += vcpu->arch.sta.last_steal - last_steal;
>  	unsafe_put_user(cpu_to_le64(steal), &st->steal, update_sequence);
>  	success = true;
> -- 
> 2.54.0
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
