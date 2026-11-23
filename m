Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795427938;
	b=Bl7zdsewdvoSowSeHAO7cFfgQeJTMG2aZ09AsbtzdQsWS/wQ7OYlwbBpAdwKUReCibir
	 m31trNr1aPyc3mWHPwUPPTDvTTPnWkf6Qw6qhID2laitEZqBT1/Hwm8vZ7xqL/SmfMQNF
	 ZzpeJlLZ5etnNA06WYJgBdhsvy2mM5uk4yhfLXR5/2bBiugUqv6FYCs53Conu4z5kBFx3
	 YKxegiux4Ywp8VtBm1fyX7wVdXIS8dxduIPROrnPw1Ugm/DLWlzvnde8LoM9iV+NxgYJD
	 SLi1h/+ZrWph+r0i2QQ4Uc/oqVyLPwWQxKBlkCgtqyNXOlWioqVwcyPA9+5CNna1wOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=w5YofJsZvwYfdZe+sQWDwSRZ1WPmdjTiSg3anH3B9G4=;
	b=UjrP6UsStE3dgc1hVgT/TDEmMEPGr5ZeKzw2iwVTZLBzWl63hqGnFaVFfW+cHMlbQV9n
	 ORHwiu39981F3mgt1Eyg4uXhjjJxUk/ymDlBWJHuLOaUgp28HtJm8CEUx2fiT2uQPgeYB
	 n7SszOJRXAmQ5R8oc79Mu+BcUpXVqKSXd1z6h6fqSupMoeybUQvBdlsMZp22/kGW2BKC/
	 WLDCs6raPaOF3hTMD/b14zzzlGMyDnNRsVkQ+V5XNOeeBA95v3mGkvya4ZezMREcluXFs
	 cAd19u9M2D8M1wDnjwM1RfmhDSWMqGeekjzSn8Fj5LtHJRb7LDkhOl17OpymwIjgpuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LcKY7/ll";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D218B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D218B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LcKY7/ll
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b596afb4c5so3307081a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:58:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795427936; cv=none;
        d=google.com; s=arc-20260327;
        b=gnzFi+WKrq7gD/GlC5m7eT5wIDFVuew8T6xjCp68xsD9snpyLQFwNQwBCSt+yIhHzg
         teO3S7+xxRu0zlebkIMMuYxGoLph9qCnI2vKHrAZcHStbGbpKjaTfHI7h09gHcY/5AAs
         eEozWL93DA54LXd+PJTj6gGW+esf9Il6OwhTVn7IrWXFh48HUVPTlv7IEaG4lmdMfaE3
         hTCaPDGCD79VBx1H06sNPAPb7w6DCn683kOv4JGggtltxXmaXGPDW968gZrCD1PANzXW
         oQaQYopYD+fFDSg7vlMteyehO2qnYxzGYK6gmcyQO5iD/VwdAAGU63sILndB5bnAol9o
         4KYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w5YofJsZvwYfdZe+sQWDwSRZ1WPmdjTiSg3anH3B9G4=;
        fh=y4FRl5hHoLHJUtiBgngywGZwB3n7njEeHZeVMG6UFeE=;
        b=sx85xHVvVRh6sg3x348yVXNDY03GbjTtLGUw+bA9vOoL7q0PClC4P+UUOw8G79mSjb
         g6BtNEf4cRNHgQX0rCibgr+nWWwSjjQ21HOgu6PcjT0b9WlEPZ5DFzEfcEWkUl4GAwGm
         7hFnI9kItOR1ubA0MMPNmeSuZcJTn1P9ztml5AJdIb2exirvU0jPMutUo/1nvmESU+9Q
         ad1UHJA7lK9XtnX6Zmh29N8t0UvEfRS5FLZ50aiAaIeEvU8iw6/SzCbtlUdKfuOAR0l1
         7ibA82Uvor+UW8ba7jfpkGDxF8sL3WEZSoug5gX9Oo6ficoy4mA0ID9SshNFeBPoMAaB
         61EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795427936; x=1796032736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w5YofJsZvwYfdZe+sQWDwSRZ1WPmdjTiSg3anH3B9G4=;
        b=LcKY7/ll/3itDCYLlLkTyocYZVEBKP2Oq9ohI0PNIQcGSnqdnGuopWwTRUWTZyeXBc
         r1futrUG0ldl+quR4RHUkW3LGekHgSz0Gh4nmtGZH5UDbwC5axbtcrFdyv647IDwUTQ2
         SLLNFa/IZwZ8FS+KriETAyqFg8x99hN3F+2w9RLhTwmVMZ7ZX4YrFx1PNKNcaVXQfHXd
         yUTbQ1IaBT92n3ccZTe0inMowWUxcYhKl9kAgX6VJvc31ddtnoOf/g3yxLeKPux/n6Vw
         JR6XlWijKRJ7CJntnxxUTU09NUqaXdXNMG8IGWaDIVvpiJxnIqT3KzEEx97rxBN4fQZR
         3URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427936; x=1796032736;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w5YofJsZvwYfdZe+sQWDwSRZ1WPmdjTiSg3anH3B9G4=;
        b=YOhyI/vkdCjOtBG0rYpEcI5CwmopOW2QNl/k3MuN1lSwrkrl4pUNJf63+lBD+hJxRg
         y7cB1ZL3jgGk0UP4Z6uKmPTfKaMQdtCkFzZLChVI2DHGasxYZNF2EacbBPDWZVKjO0F3
         Rjyg2RdU+M7182YgYQ3qQUgCHpJytW8Guom9ONx+PKcXAbIlF+yxSpbyo+qZSb6dIZkv
         Jde+hZbOqVVpM1cjECULjzsqZXeMlAA6Rds7hpdRZjYddeV4l2vHvjYUTuw8nF8+KFzO
         54Zlgp57NvKnOyFeISk+mURUYyo91mDhTtGDLMl9xx1NaPVIkkqh5jZEFy+sRuY7qgEC
         Rsyw==
X-Forwarded-Encrypted: i=1; AL+hErFh4hl+NlekBcG3QnST8y5OklP/iG+ME3xfhnYgGzUcZM4bdfpKPI6pVxeSSJ5DkL3wIREsXC6lLwE1eq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o9rcThFGixMeX0mBQ3I/v6EvKYE1m3NEKIT7cs86r1c0lRIM2
	TZUm94XSNML8/0IZb1ns2IUi0d+elV+quiegP8Ggbuy5Fvm/dcWJEvjHs4TSZlqoa0w3TSEY7Rh
	7t/Z5b3XvWklTQGeG0p9bxCHmWA+EAbU=
X-Gm-Gg: AZFdTZf7RLRfq2XzxSGpSxhXeAqkrqBtjt2Tnkw7LOqlsul6CgZ2U7AM3gfH0t0Oehn
	PeT3sC0kbSc+5XbgTHwyAb4WKXkIhqvWfHvvuq/JSl2HhPzD87PsOvXCU0IKn4O5I4exmoymVXz
	BEvqneQ9Y20kr1FFaE1jFkUKp1JgGrQL/ExK+FVdi4XLWMMUkgfaCIYCipDiyKJP2GFCBs28/Rv
	gUhnpJi2+4vy1RYOluYBKk/MJZsKsARVi1Qy2w5ZEG0ZQrnWy0GHjxAHkdX8EbKL9sUblRIvi8/
	pbvsTyE/ABRsXmlZQjMbV3g0QyzBVvlF1elno7MQSgYU/9sfrQfMX7k221s0PTue+XozNIBvxQV
	qELxY/XbF87DHglfqj/beZ07J1JVKksSTpxl4SFj680t2zOJBv9i0CWAO20aOfXtoO3PwecI=
X-Received: by 2002:a05:6402:1953:b0:6b5:6546:f7f2 with SMTP id
 4fb4d7f45d1cf-6ba37ec6b64mr7620058a12.37.1795427935994; Mon, 23 Nov 2026
 01:58:55 -0800 (PST)
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
 <CA+1jF5rurDObkiP0pg3Kp1vgB+sdxU6FYBaUUPWLJoHsoJ_6oQ@mail.gmail.com> <03349d0b6b8b3cd2069f216871046093d75b17be.camel@kernel.org>
In-Reply-To: <03349d0b6b8b3cd2069f216871046093d75b17be.camel@kernel.org>
From: =?UTF-8?Q?Aur=C3=A9lien_Couderc?= <aurelien.couderc2002@gmail.com>
Date: Mon, 23 Nov 2026 10:58:18 +0100
X-Gm-Features: Aa3M54qe_hfenKjzwiWJU9rEuXo_c7VWvMSAGUxL1_WNayADhwIzCknkL-LGf40
Message-ID: <CA+1jF5rOz0QVzK7AkzA+sTSpeSFTDtMG5K4CQzE1B_h4fBYYWQ@mail.gmail.com>
Subject: Re: [PATCH] NFSD: Reject a COPY whose source and destination are the
 same file
To: Jeff Layton <jlayton@kernel.org>
Cc: nfsv4@ietf.org, Chuck Lever <cel@kernel.org>, NeilBrown <neil@brown.name>, 
	Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Anna Schumaker <Anna.Schumaker@netapp.com>, linux-nfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 10:16=E2=80=AFPM Jeff Layton <jlayton@kernel.org> w=
rote:
>
> On Fri, 2026-11-20 at 08:55 +0100, Aur=C3=A9lien Couderc wrote:
> > On Thu, Nov 19, 2026 at 6:44=E2=80=AFPM Jeff Layton <jlayton@kernel.org=
> wrote:
> > >
> > > RFC 7862 Section 15.2.3 says that COPY MUST fail with NFS4ERR_INVAL
> > > when SAVED_FH and CURRENT_FH refer to the same file, whatever the
> > > ranges. NFSD never checks for this. A same-file COPY with
> > > non-overlapping ranges succeeds, and one with overlapping ranges fail=
s
> > > only because the VFS rejects it.
> > >
> > > The overlap-only rule applies to CLONE (Section 15.13.3), so leave
> > > nfsd4_verify_copy() alone. Instead, check in nfsd4_setup_intra_ssc(),
> > > after both stateids are verified. For an inter-server copy, SAVED_FH
> > > names a file on another server, so that path is not affected.
> > >
> > > The Linux client never sends a same-file COPY, so this does not chang=
e
> > > its behaviour. Found by pynfs COPY11.
> >
> > Why should COPY within the same file be blocked?
> >
> > For example: Windows FSCTL_OFFLOAD_READ+FSCTL_OFFLOAD_WRITE is used
> > exactly like that by databases like Oracle. Even advertised as a
> > "database accelerator" feature...
> >
> > Better tix the NFSv4.2 COPY spec at RFC level then...
> >
>
> It does seem a bit restrictive, but that's way the RFC is written
> today. If you want to lead an effort to update the RFC, then be my
> guest!

Does anyone know why the restriction was made?

Aur=C3=A9lien
--=20
Aur=C3=A9lien Couderc <aurelien.couderc2002@gmail.com>
Big Data/Data mining expert, chess enthusiast
