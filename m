Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795043045;
	b=E7N+PUt8H1gvAbyjNQdmyX84J4CdoK6kTijoCEobU7V5IPggnxCHbpQvtM2ZTBI752Ez
	 otfrQs+YUA6iS0sYht6oSC8i4v3Uw5SmZWq6yN3aG8/+Kla/NfkaGSIAYjVGn4O6g3BeS
	 53O6OqhNnMP+J2XLqgfy9G7sILquvF7C3KK2nUQT6w6Mt9XvEntf0mM2wcp/qk72zUBKS
	 NdGYmdyyTQWDO+tn/vPhC9nUvWmSR8XdALFdZY+Jxo/2u059ypndpRa+8vct9+af71Dmn
	 P06a2r+KX1iWVhs4+Zs31xBbIajFfQ+U9PyZkBvyihRpmW6+sPdvEffEWXX3UBbV1fQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MAi/zi144A7lSdUiZW35UwZ1ctSLyO/1ahXdrUK3rb0=;
	b=pzw96N0dvdbI/mMseLuJ9nfF8o/SBmq8/ANbvwzePPZmnqYJ/wwb8UzwB4lc13hGP6BQ
	 +4RIC/W2Ei0c6Pw+nZDqVC2klXK2vjx9cBDhj8CQaX5h5di27hPAGU4bkNv27qfhgViGa
	 BUeH20amkpJdpL84EWTa3KQeNazI7xz9qdE5KYo8KhYvns02w/swA9aUAKThrXEYVCgz+
	 KrCd5aYVsbJUrPeGCR7+gHP2gkz1b/EmprQJislDwIjGwhv/xwX/FRFqsU82pNigj+CDT
	 u3/V5i01YTo9N4eLkKfxmJpOU9k9K727b1tM41Ziacuamgi3oTQ/p8GgP3EBfubj/2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LLjGUmcb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E864C60A2639
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 23:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E864C60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LLjGUmcb
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b869ea8224so5803a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 15:04:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795043043; cv=none;
        d=google.com; s=arc-20260327;
        b=DSThPHwBzsXToUuiqM4QUJA1V5TBRR2U1FnJgrOAxl6iDxeSf1J+J7le7xtM86CjL9
         ZoIeYhPBKMkzZMhbQHe2T+rp1r2uWNP8yMZbfcYqhj3Fg7UIxa4FnRVYJjbBDoxY5+dX
         a9IbU5qqoM7n2BSMjwXiRRSg+lqsu9CIzwczuRGbvSTmjwx8dfcldzH8YS7HZvNS9tH5
         9dgArtpQN5L5VGS4rVK1ShiAFM/coxTh8znePTFb9IBde+xL0zmZ+f7qOn111O2V/FT3
         4ha6gnvzVi7CykcizcvvlmdFJW1WpkmiVnW6kiT8PmCCI/d2qUA4VGcUh7KURDvaPVIY
         /w1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MAi/zi144A7lSdUiZW35UwZ1ctSLyO/1ahXdrUK3rb0=;
        fh=UWt16hN9CCDTe0bIyCpQDY6DOFcyl58KTTl+AoIfKNc=;
        b=o4PQohp68XhIzAW2u+4vbcR1sOSdXW+9+FjuT888ftlTcYfJxGhptXLRxmyGU1aOtz
         3WtnxE89xilO0fsIRrIEgBWUB3HDUIyy5XvTNmovAHC/0z2h/4Mw2/jLp+P4DgkvXnm4
         IrIIS+4Q2K2LkS5n3ZudxQrEas5GfMMMJ14M4go7tAPy5FE+bsym8HRf5CBxblnzUVqN
         smmS5IELMCAXggCjj+T3d2FktTxfUNKlowmMvaFew6V9IAh3gFY6Ks4YQ8ngxWTzmgrZ
         T8/0U8gR+uDEG805Jgu89vt7jCDd7X//ylnCqsSEZRYCQLrFu8hER5LlOGDNw2LrQmQ2
         APSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795043043; x=1795647843; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MAi/zi144A7lSdUiZW35UwZ1ctSLyO/1ahXdrUK3rb0=;
        b=LLjGUmcbxb2iraEZrpFIRA7nRWNm0jyt9aglLqdnlM9xepVF+60SGZlVX3J9ieOcya
         SX93ap5ZDbALGsrUarU2TAR0lnWC2WxueUlotkOa3iPwcM8tk/KudierNYQo1qFHF+jK
         lvfyHIEJwktft3MACLylYzuf1gIaaSG6xQmXL4PFnngvoCatQg61hjYKgqdYx3PuzFko
         9W9fjTmtCYllchJzpYbJafRaKepBI88Uv+IpSceGaA351NMSVdRoiojRPdorJDtITNW6
         aJoo1lBkB1GKkm768oU/dnM/rrnAoSOwYRi8mPXVJFnQaAaWojO5luTxVgSL7FBWDa3e
         kDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795043043; x=1795647843;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MAi/zi144A7lSdUiZW35UwZ1ctSLyO/1ahXdrUK3rb0=;
        b=hTzudK5QAJtIlPWOYF7jSAEbbajzXc7PoRytOsFPNTkC25Ffsvqb5k6fzdQCvFABNG
         X+6VFtEQFYRxD1gfMcwWpEqcOZ2ICTf0jBT91fzAP55Y7tAfll91RtwTo9sqev5zBFGZ
         OYth0hiNOD1GZotbnCWCtZLNTG6w02AI7J3LUTqeR7BFUVPCH4qJKtHb0e0iUWrz65Uy
         BmvMfSpVsFKFKz3vP8jpufaYjsuUfI+83ja1E/0gPHBEFjR7GZrTfYEoCsILaNFY7Hga
         N/RbO0afJV13ggHzw6mFlUOdD4Oi3CMOamcSomt77pe2BSLWlrH2rpP40blbwZKZT2nJ
         v7QQ==
X-Forwarded-Encrypted: i=1; AL+hErFrCGM/wfs9NDHaGJg57CkVJ+zCs0cv+JoxdebUBdTtP/5gaHCs19svgQ5wJqHa3LjAMGeB2NH4WYCBvCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UkHF6nIcB4c7uWN3z8l86UP71qFIi5zw8LCaZerqNVofw5gc1
	rmLIcphWcNNlZ9GH2aNhRnMN4yGwQrADbasMDjBLOoCyRbXLKnrLSPObObL2o9RWRQpcZXK5Mov
	cnEUAFvrQM2oHB1RmGBIlgk31qT4Q7cGgc/u/wvlS
X-Gm-Gg: AYBFou3XoXvk5iHUfAjWd9sQ/AxpUSThe26zZzWTU5+yGVGoc0o50zI/6tUGxTJyNNW
	HDFzNEv36gQBQMbhWiGkrAnTBLu1IK1TkVmiUygVY/+qpdIsEQPEUSL8VzW+czFkTyUFgaSH+lt
	WZW47dRucJn5+T0Z1pqWHMK540sK+VbPZRQ+EbusrWt6+KT9llbyTpFlz8J02fw2Eq1QoZK7zQm
	YAkvUXvqMextg5Ga7gNjpJdY1LwgAQkazrM8cRhevie3AIDl0EYXLwo1oxLcVtN2FSylKniyxiA
	AXAjo08F8ANOC/wzB8gfSbQIc8TsY0INK0OGKrAq+9yOFnyoGPT0hwZToF//rzJBwDKnN5KLVQ2
	6z+ps7AFILnMvH7qMoQbT3LUsQFuRoy7FsU0CM0fykWW0ukojc+4LrcwAs0RuDDYiFnCiQ4uHd7
	BFuoOo8xFcysIGCqgRg8jmrnGqbc26ku+Qth/JlN/bSkXTgeIbTf2wBQ==
X-Received: by 2002:a05:6402:22e9:b0:6af:afce:184f with SMTP id
 4fb4d7f45d1cf-6ba0372fb5dmr32913a12.3.1795043042870; Wed, 18 Nov 2026
 15:04:02 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117180310.921701-1-chang.seok.bae@intel.com> <20261117180310.921701-14-chang.seok.bae@intel.com>
In-Reply-To: <20261117180310.921701-14-chang.seok.bae@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 18 Nov 2026 15:03:49 -0800
X-Gm-Features: AclHuK-dozZ0LhHAkPXP1vXJkCKgeOKrdvRN-Wa7AZzg9RaoVZ1EP292gx5gh9U
Message-ID: <CALMp9eShHKZ9xUUo-7TRwJ9LRpLDBG2sRERZG8_amjphjSvoPA@mail.gmail.com>
Subject: Re: [PATCH v9 13/20] KVM: x86: Support REX2-prefixed opcode decode
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: seanjc@google.com, pbonzini@redhat.com, kvm@vger.kernel.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 10:32=E2=80=AFAM Chang S. Bae <chang.seok.bae@intel=
.com> wrote:
>
> Extend the instruction decoder to recognize and handle the REX2 prefix,
> including validation of prefix sequences and correct opcode table
> selection. Prepare the UD opcode flag explicitly with Undefined, instead
> of zeroing.
>
> REX2 is a terminal prefix: once 0xD5 is encountered, the following byte
> is the opcode. When REX2.M=3D0, most prefix bytes are invalid after REX2,
> including REX, VEX, EVEX, and another REX2. Also, REX2-prefixed
> instructions are only valid in 64-bit mode.
>
> All of the invalid prefix combinations after REX2 coincide with opcodes
> that are architecturally invalid in 64-bit mode. Thus, marking such
> opcodes with No64 in opcode_table[] naturally disallows those illegal
> prefix sequences.
>
> The 0x40 - 0x4F opcode row was missing the No64 flag. While NoRex2
> already invalidates REX2 for these opcodes, adding No64 makes opcode
> attributes explicit and complete.
>
> Note opcodes marked NotImpl alone end up in handle_emulation_failure(),
> but that will inject #UD eventually.
>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Link: https://lore.kernel.org/CABgObfYYGTvkYpeyqLSr9JgKMDA_STSff2hXBNchLZ=
uKFU+MMA@mail.gmail.com
Reviewed-by: Jim Mattson <jmattson@google.com>
