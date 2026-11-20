Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795161378;
	b=GIrOnfG6/vFqGk9eVueavC8ToUAbr6Mf/YTpcZcKovAtQhPA2+QaAAVLjGUVb3SSpAOR
	 togEnRtYX0Oi1aiSp8g7p7S6zg3RZmb9q4SKXQ4LMV3bMu6uXmx6q5f3MUBgFsImlCvdU
	 ad2Pky1cVtl7sW03+XJ+aSGn4f+bhig2O4HaEBqcL+WTH29r+cm8jZCpQvHTPYyBnAdb8
	 FfXliOEZZTXzjM3Zx5mWqFlLyVErOWGkXDRs+X+9z/W27PcvpgGxKMRq6lPIfWRxqdUTT
	 Degkd4QAtMV05HNWy521/z9D80YHMKbXFOHt5jQ0wQkM80SapnhMD66eqa+9ACTMYsg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D6D46AsAqBpehZlFwumznPvfnW8E6n53WMjbxwAnW40=;
	b=w9FeRyw1V4iQIeMFeqotXMRrJAItzwYM0SJb1QIWNJhc5j0VuB7qZNgGOb9/385DDKgh
	 Iol8delWuTFHuJgdT1zPR1T6Mjt2YPQSlYcD6/tZFOzIOsn+p/13d+4Jkcgj2nJYlaD/z
	 8MDiW3kVzUvrzSH07Ua5m+8e9YEY41kzpn1FNXptTwvBuS62UzuZAmeE34A1VTsJOz0Gm
	 sU3CB2xuNl6danYVlofPLQy8vq45QIL72aDsE7SEb9UHDmTzj8fhDlUMu/pZLGSU8DgYO
	 EbNefoDSOtSX5yPsCF44/pw1E3ii1R1Fzsocvn6TaLhkSS19vnjrlKRADK+RYt/I3MA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ygo7u8hh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9468606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9468606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ygo7u8hh
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so726837a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 23:56:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795161376; cv=none;
        d=google.com; s=arc-20260327;
        b=clb8Vazws9cpHf94fHnkW33MrI2o7qVTVN7B31+l90oIBNksnZ26Cbqq0imHh29OHJ
         xfY36CyhOXcjGTx3F72u/p9CQFTSB/XWpehVQigYVLMFeg9CAz54i5RWRxsL4mLDw4Ds
         oAN14mqO75ATu19v3+fhqBlZIB1n4iEv8VgXd5E/uOMjs6rfDQIHAV84WgPvohXjdXhg
         zYkU49DAtnJ7jUyJVf6ENt/2NwKDqme+txCFh71MQTiJBmzYESYKxncJjkzxpU8Ht+W/
         r4t7jg+p0r7Ud0o3zhGPoo3h9rbYx/escxYko+JX6qK7PZu7jfH6yfYr6fs1LLAKz8kY
         sl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D6D46AsAqBpehZlFwumznPvfnW8E6n53WMjbxwAnW40=;
        fh=CEqEPJX5bjDftyqOejEJQgwQ9nPyyaI22Xga8awQ4Go=;
        b=fKCGI2fMt0W9AKVV5veb6TarQuc20LDWtNL1VuqsrFj2lwlPA2rRwXWZTzPKSByulp
         voNQHsyOyH0z7D/RjgYtTcVJiire2l3akkXrbbLPtc+rgCDOGtA5sHvIs6iEP0oAH+BU
         4bqIYTy9hPUkQD7fgVnXzd8lW0QPR1uF54GMTO3NtWhBsQNHCV+FHHKmzNhcdSgURnz5
         do+0jWVElZN3BhFlhHkWSvMjfHMVnrapBNn3cshFq5pQkIVkOlCJ04bCm/fVAzFq3wdq
         pVUqq3rpbsWU0ElyU+9CS0LjgTjYsbDsPnzqxgslEwywzYGIwRvHXGV2MxGZbe9tmZCh
         DJpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795161376; x=1795766176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D6D46AsAqBpehZlFwumznPvfnW8E6n53WMjbxwAnW40=;
        b=Ygo7u8hhmT8ZRlQdmS0vOD0LtKqCRvNQy8jKtH4jKR6rqYRw55nOxHH49oSqwd7310
         tqh0K6hEP33VvvjziZCuo3m8QswhaN3kPeoSMEm0e3vamqxNJYSzr1ogjhjwG8x5kgoA
         O6hNEcPAPWKodC+kQWJklTSqcn8hda7Sja3R2uUvsbTtUVBI27nqXzheiNBf38ERo3NX
         ey6XMfzoNtmgqw/zJqTMOnp03ljHQz5A4Y4uXTPodouzp1/HYxnKXzq3R0cHZrICpabx
         ixSDKTsTv3sotbbXlaJs4vwkgaS8TSHoUl8mw0inid7Y0tkejNrg13cwdskBxffkK1Jq
         GO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795161376; x=1795766176;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6D46AsAqBpehZlFwumznPvfnW8E6n53WMjbxwAnW40=;
        b=Ddkq3OJ2RL6OVg08hRuZr4H0zZF/Ytw6yGZKTONhOjuMKvjleTfwES0nuxrnJPeMPH
         Fm59MurLmtGYUzbrt88CeirTFWXFXljztY5aOQDWn8SNgMahLuAra5iVn8PC8WWiI9/b
         jVm9N6mvVxPr6VELBJvRRorj+zkjONBZrvc0WJe0Kr96gesU0EGm+S3NKcxCm0wehZDf
         DBiPZfNSjbJvQb6CXe9nVkRgTbrZQ32T5zO55R2Aq+mvQpQ/Ogbd6TllgLyAttvgGOi/
         Rvy3WqFEIT/4dXQtnHKAl0GlAOwoPkMb9P60XjeWQrK1T8o201WqPbwkcKXAXisfRF5x
         f/9w==
X-Forwarded-Encrypted: i=1; AL+hErH9S/gHUu85DoMyP/xdYvV0E+gWPG4AyIsRupxoCJCh9jszuF9tGWZ3wIya13+klc/t8+RTgUMihoiyT6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TRp3K9C6FjJofPQ3Jan3B/6V/m5G1ukbayLb+2NdV/hD+wqIn
	O1SqOs5Vfx6ksGv1VLElWbG3weDIFas/mEEWIFZKuic08+7NKxvwAl2mKDJVo/XEY5N2oqUx0pq
	NfSzkuakrn221TZeHY0WP+49KcwpJkoE=
X-Gm-Gg: AZFdTZdVfmGq7oeKWIQKYengmsmxCrIz/oKgOnpg/vpb/9sMaSKodJuOWn3dqSBtvgN
	reBdScFdp46roEfwZcx46mgH3ZSi79u4tFzl9IyNSL4MKiwsbs1TrCAZVoneb3ybaTAlMsu5sWu
	Qz4BdLB2tkztwbUk4dga0lJ4TIsF1GshubcOotoZuHP/E7PdloqWr0tR8LnH+nziCyyK99tFGxL
	VOfynK/DuwE4FTel+0OG40DRFYO/lzaADkuEyTUSeFA9x0fnrFe5KmcQOzNK7p8UCT7jFTziEAw
	5/YtK9ZPoELOUH6uRj2DefKPTCtMtDYWA/FbXL7DfiiZgw5oPaR783sM1VHRt2SV53uemQzdYWL
	jgysapQHwKDl07iUmGanLOHEf4y3kEnaSEPmd0tWEf8qB1hNq5dcd3QMjgyJiFe44R0We
X-Received: by 2002:a05:6402:c6c8:20b0:6b4:1037:2bb1 with SMTP id
 4fb4d7f45d1cf-6ba37e90658mr958557a12.22.1795161376138; Thu, 19 Nov 2026
 23:56:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-nfsd-copy-same-file-v1-1-ef18e53a00d0@kernel.org>
In-Reply-To: <20261119-nfsd-copy-same-file-v1-1-ef18e53a00d0@kernel.org>
From: =?UTF-8?Q?Aur=C3=A9lien_Couderc?= <aurelien.couderc2002@gmail.com>
Date: Fri, 20 Nov 2026 08:55:00 +0100
X-Gm-Features: AclHuK8gGGskXGfFPzME8Y_v-1TiWdShNUYoz4-qwshh3EGdWiYpATvAHeQokQw
Message-ID: <CA+1jF5rurDObkiP0pg3Kp1vgB+sdxU6FYBaUUPWLJoHsoJ_6oQ@mail.gmail.com>
Subject: Re: [PATCH] NFSD: Reject a COPY whose source and destination are the
 same file
To: Jeff Layton <jlayton@kernel.org>, nfsv4@ietf.org
Cc: Chuck Lever <cel@kernel.org>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Anna Schumaker <Anna.Schumaker@netapp.com>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 6:44=E2=80=AFPM Jeff Layton <jlayton@kernel.org> wr=
ote:
>
> RFC 7862 Section 15.2.3 says that COPY MUST fail with NFS4ERR_INVAL
> when SAVED_FH and CURRENT_FH refer to the same file, whatever the
> ranges. NFSD never checks for this. A same-file COPY with
> non-overlapping ranges succeeds, and one with overlapping ranges fails
> only because the VFS rejects it.
>
> The overlap-only rule applies to CLONE (Section 15.13.3), so leave
> nfsd4_verify_copy() alone. Instead, check in nfsd4_setup_intra_ssc(),
> after both stateids are verified. For an inter-server copy, SAVED_FH
> names a file on another server, so that path is not affected.
>
> The Linux client never sends a same-file COPY, so this does not change
> its behaviour. Found by pynfs COPY11.

Why should COPY within the same file be blocked?

For example: Windows FSCTL_OFFLOAD_READ+FSCTL_OFFLOAD_WRITE is used
exactly like that by databases like Oracle. Even advertised as a
"database accelerator" feature...

Better tix the NFSv4.2 COPY spec at RFC level then...

Aur=C3=A9lien
--=20
Aur=C3=A9lien Couderc <aurelien.couderc2002@gmail.com>
Big Data/Data mining expert, chess enthusiast
