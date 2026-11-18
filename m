Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795042975;
	b=gPp1STWyVLw+nAszNpq64x+FO/tSOVju7Y7BWZKB8uzMicHfOzRsFTPAKUe+tgzXQvwO
	 pmG4XvrY/T4tJHijJNz8tDO8QSG0MzD6TgEN0i4ZFr4sBLHjRhSSsc5SEkyp4Xq6hwhqL
	 2XXF/C3lw0HFVOhEp8jWr+7hIH3ebaNr+Ua+YKUYgW3LvhhRGeuHM7nJaAWHekv+hrViT
	 0x/YU47MsB1nXX3YEQpnV5JRp79SccMgelV46Bk8cm2JWjH084PFlnJ143SpRZ3/atfWf
	 MktsZtXDxI8KPSHgof6Qc/2hMvBX+2Yz+Q2ViPq2VezNQb0lzAfJJxtha/oxSqHdhRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795042975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7FzA+ke/n3Erd5b/H6QPMWZ41fDmL1p0bOBQCwwbtzE=;
	b=R2AXgAxZ9aeQAKOwHRdcNb/FrNe7Rit2WHdi+OYi4gRoXlUZoYFdYuYhLfy0dFQi5EVN
	 uOH/hmbEEnVxUc17fMWMmuUL5a8ePoZDN2yhI8/jMfqsKcEHpQwHiE2f3NknR5CqYf19z
	 6bry9Mz5qRIruuwzLqGG8at3tqtV8OSYQ0ql/EjVgbmPhhA9he1wWaZl73UIh3WK2E/lf
	 LrJJN03CaWbBiJCkKtWVZ/wqwU67B+nHZkmQu7z0kOW5nPdYH+NqRPfAnRvMuOyrUBzys
	 /pPg0XJpqBwMn5yopprW1fbiFaXzVGaqnzCblVnJaR9v4fYpUO7HtmnaJvLLinTgAHQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CZqX2iQ2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04D5606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C04D5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CZqX2iQ2
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso1860a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:02:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795042973; cv=none;
        d=google.com; s=arc-20260327;
        b=m6Pks7g//iTng1RmX3EbEVcnbJezPcFvvCgyzaoaMm2kWJrAajNij6UvF3+/A5s0S0
         pK/BdF6ruhFOxfjJxrvZF2PluH+kZwyyIHV23cLcv0FQPezeygiH29o1Hes9o82l81QT
         TrQ3XsvtWKsqne5qqW/jodEaUE6PTKhxpJb/GNQix9XNJjyAKaAdOljIMncw+xRlYVYR
         O+DJIjdZfvQaGw72SpuUc+PPa/FYbEDIbIcoMi/t6HNmYkHvvQqsJaJzdkZj+LwtYuCA
         MhE3aiMsFkVTPq1DdimiJSh0X5XOPx6WLodfyOzUAHveKk698IHQ7En83rVSjavaZWBn
         svFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7FzA+ke/n3Erd5b/H6QPMWZ41fDmL1p0bOBQCwwbtzE=;
        fh=Dn7ETGXZMI40ZOcVj9RM2E6S256C+R535fjI8vgEswY=;
        b=lh+w2V1mmrQYz7tQJDp0s1um+m5Gl1kurGtC93Aj0aSOxWS0ZIsrjx2rWVC22pPAre
         Ng7Jk4kGE5EJPPGD/9L5hQSSDVOKWd0c4A0BGgGzrGuLUF4GG1RXTM1YAXyv7Q1HkFwJ
         Mp9P2Rx80caseRfnzt4mTK9LbNwPglPxv8jIp2jEC+VR43nIfutV7robVrxJd5vC2Kdp
         oQawLftggMyeStmPhHqFHNi30zUBIhUC8h6EZ2gVdsWg6r3weayIJbuwkbMH5R2V6EQD
         s8e1W4KjorA1NS8eb8AEC0Oy6LnNUKFgLFIAh5mMGrA3K9N4k49YSvzOqkkMTR2K8K6+
         55XQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795042973; x=1795647773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7FzA+ke/n3Erd5b/H6QPMWZ41fDmL1p0bOBQCwwbtzE=;
        b=CZqX2iQ2BM8t8zm5yp1v5G9j8TdEgxOQJ2N4wFNRg1XeVpiG0SeJoD1BX6uZYjfNrT
         MNROBsgw135xaJmowVch4HX29CQBwWdMl4Dv/AAXormG/NxOVHnbtGDgxBsH9gPDhg9d
         3b8d3DEyewYfesszv/oIgPc6KTUUDsUSQDuEAowEjaNsLdfaNdB1jOHCRXPgg7P7bLx9
         KmL7nEosQKTErhadG/08fkGT4eEHvLL1eWzpnIVm0tSIipbifPFgOj5cVRnliBD7vKlb
         On2/4Wq41lZMA9l0aT5S0u8CPcLkSMNeuMePuryJhou0JG6bLDGNcTLTO3ioEEFbPvbe
         rUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795042973; x=1795647773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FzA+ke/n3Erd5b/H6QPMWZ41fDmL1p0bOBQCwwbtzE=;
        b=naiw1C9URE4FcPhkhtV8eYpHOR5x0RTeR1C6gkv4oUu1C4x+MQ1gr4lI5FBcpeNqW1
         p1/gs8ud5vin1fY9iOFr7A2lEXedvweyaWJrxwA3nkbY0oAfXI5rN9oET7dU3TOuIwf0
         SsiEIGvrmrX/Vi1DrkW+AanqRoAYGSgS+yWY1wOZttd9AQ2SC2L7hB8HAXyA+GvZLQGr
         N0R61JUkFlY/TyZcEk7j/2V3TBW50eNxT9i9n8MkVqW0sGZgrVdzWdg2XOquuV+s8VVQ
         qAAJj1JdYofBZyGd0zWHgMfYhkq5MTO8rnO7TVCKf4GTl8ltQyRK4leBV3cbI1VHn/xj
         AUxw==
X-Forwarded-Encrypted: i=1; AL+hErE285Ht8YDEtJ6JA2ZshpX1TcAiX/dJry/Y7YnVhlRQq8rHTHdrlKYPd3bwjf8YdgcpwXIz8pDEAAiOLrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZB4FuhkNLdHhWDqZywXS7rw5hi2Z6C/hkpFZ8syo2dMhqpLRI
	kfKs6mZBRqG6bW69tvSQZxrWGotv0N17KyKFUi2deroHKalgxQNsgtmJ264rHw2RtlPPAviLEj9
	W/wvX1v5u93Af1rSavUraIP4LAONuIPLgbT2hO+SA
X-Gm-Gg: AYBFou0y19uuZdPXltqz8T+apQMrmIJINhDPNFe5pOvy2unNMGZ5iUw6akmi9b2lvQN
	fJsskbvtzi3Xo2zd+0aZp106ymDvoTGc+kkTrqOr+tyoi9NA8xphcJu95RSNzdP2M+MlCLMeFeH
	+xfMLEcmVrPhLQhgPLVYrLzMdb6cAcYepbKdtTuBOkjCD7mwB0Z0Mz1O2i8RdO7d+ak+YLpvqCn
	d1NjiNLD2nIDPxFxZvzqvjV74ObJGPkm6TkjHKHTL2UJ+bdN6G3hlq5TM34lEBrAk1h+dHqDfHE
	mMT+CgarMeZV1N82r9IH7mb8L2ojNXNxQyhuf/tgt2bUYrwYHxo68jcT+LbtbxPOtcDHp/5gMov
	FcN8Iz8PXNgcEwqdi+VE03rXBTcJ48n2wJltDHGNF+oaAnVkoE593FI2BbC0pgNouBOe2QcskCU
	mYzkELtZaftD2soie0hhNi1zka92sM2FhmW5rS0pFaI1Uxgkyowh7TbA==
X-Received: by 2002:a05:6402:789:b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6ba10d4641dmr17515a12.12.1795042972709; Wed, 18 Nov 2026
 15:02:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117180310.921701-1-chang.seok.bae@intel.com> <20261117180310.921701-13-chang.seok.bae@intel.com>
In-Reply-To: <20261117180310.921701-13-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 18 Nov 2026 15:02:40 -0800
X-Gm-Features: AclHuK-LygAKr8qFmGx5XYSpKbdRaRYB2A8JlX05beTuE1ipf7fbbP2n4g6Zmys
Message-ID: <CALMp9eQBQnitBu0ybMz7uidz1KLvMUi6GChyrp=45Qw1j=1i=g@mail.gmail.com>
Subject: Re: [PATCH v9 12/20] KVM: x86: Handle EGPR index and
 REX2-incompatible opcodes
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: seanjc@google.com, pbonzini@redhat.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:32=E2=80=AFAM Chang S. Bae <chang.seok.bae@intel=
.com> wrote:
>
> Prepare the emulator for REX2 handling by introducing the NoRex2 opcode
> flag and supporting extended register indices. For the latter, factor out
> common logic for calculating register IDs.
>
> REX2 does not support three-byte opcodes. Instead, the REX2.M bit selects
> between one- and two-byte opcode tables, which were previously
> distinguished by the 0x0F escape byte.
>
> Some legacy instructions in those tables never reference extended
> registers. When prefixed with REX, such instructions are treated as if
> the prefix were absent. In contrast, a REX2 prefix causes a #UD, which
> should be handled explicitly.
>
> JMPABS (0xA1) is an exception: it is defined for REX2 but mark it as not
> implemented, since emulating non-memory operation isn't practically
> that useful here.
>
> Also, ignore the high-order register index bits when accessing vector
> registers (XMM and YMM).
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/1ebf3a23-5671-41c1-8daa-c83f2f105936@redhat=
.com
> ---
> V8 -> V9:
>  * Fix the vector register ID (Jim Mattson)
>  * Clarify that JMPABS is not implemented (Jim Mattson)
>  * Move the NoRex2 check below group flag handling (Jim Mattson)
> ---

[ ... ]

>  static void __decode_register_operand(struct x86_emulate_ctxt *ctxt,
>                                       struct operand *op, int reg)
>  {
>         if ((ctxt->d & Avx) && ctxt->op_bytes =3D=3D 32) {
> +               reg &=3D 0xf;

Thanks. That takes care of the BUG() in _kvm_read_sse_reg(). However,
you didn't respond to the other half of that comment on v8:

  Similarly, em_mov_rm_sreg() and em_mov_sreg_rm() use ctxt->modrm_reg
  directly without masking off REX.R / REX2.R3 and REX2.R4, so setting
  R3=3D1 or R4=3D1 on opcode 0x8C or 0x8E will erroneously inject #UD.

Per Section 3.1.2.1 ("REX2 Prefix") of the Intel APX Architecture
Specification (rev. 9.0):

  Furthermore, if ModRM.Reg addresses a segment register, both REX2.R4
  and REX2.R3 are ignored.
