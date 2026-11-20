Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.240.48.188
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171497;
	b=mp0iJgEmCGxrvoFomP3g8/0CBCiJ08q89eMcDfZ1rFmBQgKaIxSxBgvx/inF++7WWAXA
	 wpn0TpZ3FH0sHoAfHN2xc96ivQVSeVbI/rbzawkr+37NzZ45D+LyaNSCxjoF54WPnO0Hq
	 bwzOBkvwcrXuk5Q2efRl8xSsNnFerpNya412wF1C7QXlt3UuUyixA+tPS3YqSZDS4N/vX
	 3QndPdtJ03nx0GIh82hmIWrLc8j67/kxi/+eM+P93CPjRu/KCv+2zDySUAqdIk9yvy17i
	 w/+gJPkzTsxi9+GzlOeEsIgg4KMGYdaYTkYY4Nz9d/dFfFy73eVss3xPBpMp55rgkEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171497;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=r7NOUwZ7HKbF8wPBcMERXebPtcGnuh6Cp251eU6IQtA=;
	b=u182zjF71HP4fTUFcLNH+qe2yWcQ3UAGICntaVA8AoXFojwbC0ln/ob/ZaJxKeT1RVf1
	 Y11g3WuFhfB/4ure5LVXPClghuzB2cZVxG8OaJlKiVVUrsa7UzyL+PByo69UmHKpCHVbv
	 ENvVSppNwhAPYxU8bj4yYs1o6d+n1BuH/Hpoy9VgA+/QmRfFB9bqzo1rjKk+0JwvU+9D2
	 YAeWtUboEf5nq7SrlXVB2a4bnMcpu7D13uRscwMtOry8TEMFO0uiFUyfEij2NNmWSS5DO
	 TMvArLqOmiAc4NvMXE+JF6aN5iZHGmxQA+x+n099oGjJVKuJcxMQd9cy5jBy1A4hNEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ahmedabdelfattah.dev;
	spf=pass smtp.mailfrom=send.ahmedabdelfattah.dev;
	dkim=pass header.d=ahmedabdelfattah.dev header.i=@ahmedabdelfattah.dev header.a=rsa-sha256 header.s=resend header.b="n/RJlktx";
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=OjNlWpfU;
	arc=none smtp.remote-ip=54.240.48.188
Received: from a48-188.smtp-out.amazonses.com (a48-188.smtp-out.amazonses.com [54.240.48.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D2C606A337
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:44:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2D2C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ahmedabdelfattah.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.ahmedabdelfattah.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ahmedabdelfattah.dev header.i=@ahmedabdelfattah.dev header.a=rsa-sha256 header.s=resend header.b=n/RJlktx;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=224i4yxa5dv7c2xz3womw6peuasteono header.b=OjNlWpfU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=ahmedabdelfattah.dev; t=1795171496;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=oEkLVLA5jQok7pN8N7y8xe+lPfTl3Cpro7ZDYwpZPk8=;
	b=n/RJlktx6LHIUKKvXBxkLNws4YiSqKtl54Sk4jyOcRIKWRuXOGn4tQAvUmShoZb/
	fdUbDNksFniD4gDLfp+kWF/WyZKUEgB/1hhtZM0ln82S1zeyytzc/lxMLC7/0i5x7HL
	rg62dqFK6SNPNpnQ/okHB3rfkX8+feIYZ6Dh7oxY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=224i4yxa5dv7c2xz3womw6peuasteono; d=amazonses.com; t=1795171496;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=oEkLVLA5jQok7pN8N7y8xe+lPfTl3Cpro7ZDYwpZPk8=;
	b=OjNlWpfUFx6IZ1kOWJ6KV0gthrks5hpOVlKecsFPfrhy11cXT81dZp2Yhp3KIjQ3
	m45cBP3Il9yj8YqwErwNVIqfueWQHTE6FVKf73WQ94OT09Zm9rPT6IO3TZduLidOsBs
	uWsYyVdqvi4s9AazNEJ3uOZnxYBwAVdeWt918Oi8=
In-Reply-To: <awAGxH0bwT1xLNLy@intel.com>
References:
 <20261107-x86-apic-lapic-resource-v1-1-28de4cb3fb1e@ahmedabdelfattah.dev>
 <awAGxH0bwT1xLNLy@intel.com>
From: Ahmed Abdelfattah <me@ahmedabdelfattah.dev>
To: Chao Gao <chao.gao@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/apic: Use the physical address for the local APIC
 resource
Message-ID: <010001a1f88f2f58-42fb2639-5ecd-4524-904c-d7d1b108561d-000000@email.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Fri, 20 Nov 2026 10:44:55 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.us-east-1.uCKvsN4fow5iTxhgdfCiLkD52dLS8e5zeZeNIHIyObThYgWj6io55JEpA9Lr59BibvMHOQwybONW0pi/CZ0koY1A1i17AG2yWEV8SeTaUDUkRN5zlcaoQEhviEafOoOqtPZhQs319GE3nsx7+JZeBdmAUyq6td6+kg0Qy2oXHvo=:1.us-east-1.pAEstvQcjyhQNKGKcgSlzI7SVR8ZSG5wSmKwiz/A8Dg=:AmazonSES
X-SES-Outgoing: 2026.11.20-54.240.48.188

On Fri, Nov 20, 2026 at 04:37:24PM +0800, Chao Gao wrote:
> What is the impact on end users if this isn't fixed? Please make it clear
> in the changelog, even if it is minor.
>
> No one else has noticed this since v6.6, so it looks to me that nothing
> depends on this "Local APIC" entry.

It is minor. Apart from the line missing in /proc/iomem, the page is no
longer a busy resource, so CONFIG_IO_STRICT_DEVMEM does not keep
/dev/mem away from it any more. I checked that on v7.4-rc3+ in a guest
booted with nox2apic: without the patch 0xfee00000 can be mapped
through /dev/mem, reads return the APIC registers and a write to the
TPR is accepted. With the patch the mmap() fails with EPERM, as it does
for the IOAPIC page.

I'll put that in the changelog.

> Using the virtual address is clearly a mistake, so this fix looks good to
> me. But the Fixes tag is wrong, as "apic_phys" already held the same
> virtual address before that commit.

You're right, thanks. It was 81287ad65da5 ("x86/apic: Sanitize APIC
address setup") that replaced

	apic_phys = mp_lapic_addr;

with

	apic_phys = apic_mmio_base = APIC_BASE;

and 78c32000848c only switched to the other variable. I'll fix the tag
and the description in v2.

Thanks for the review,
Ahmed
