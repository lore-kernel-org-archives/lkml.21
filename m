Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795661295;
	b=U3OqvvOL6yk/EyvGfvzh0ApqRBjwhrt+vsUOsThKqomHRXIMHCcu3xljFjXhsYTFdXRU
	 8wRnMPq9zIvySw2x16nHr/D+Um20f7/mznPo//sDhkPQnURFdtTm6pf39poLJBTz9835N
	 Xt3VxuzAkmSp6YDCo6KuwVQPaLAmfX6itf8Pv5rvGY9UzwV5SRCkVkX13l8XqGTiRjyER
	 zWwPMHp+4VsGo7AdL5pDZ83VKR16CIT61QFIkNUdf6tJe9rDSrYT6U1yLCQs8N80icw9C
	 afwzZhvz9bN1ZLhhylFEgaw3KvvhGQgqawbxhQ/MYdxWNtvFs6d4F03qWCpfZSXqE9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795661295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sSFnpqUuUbjElix+JO0v+jouPkVBxE7R6M/+d3k0EDM=;
	b=ydY0/VW3xTIMLPGtFwdZTOHS9JAXDdcx6yzm1CHiIqEh0Gbi7mQoo0NbqGyqqqBKtYCz
	 bLJZPHjnIjNfk4WFrLNZ8E4uBbT2qgb0lhtAA/Moo9gTSlIH4JG0XUgvoDcUF6agzQ0Lq
	 Rjh2d/itmN1jpbrrGNm562wl88A5yRBigzltAYWQ9NSZnSJTP1J2tLVaKBuj+nhEWtAi/
	 9+YxLdrytesxapvVUbgJ51mPsYMWcYarTto/1Z5ooLCmLNZ11Ol57cxfEIt/aRrr1vB9G
	 6cncK1c44olJ4HZwHjXHqHQHK6pQuFK3+okh64924xvJGWqU2AQzkJ5H7TbUVbDPVSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RZStdTq0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD8A606A323
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 02:48:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAD8A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RZStdTq0
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so8521181e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:48:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795661293; cv=none;
        d=google.com; s=arc-20260327;
        b=DEp5mPDzjIvQfXy9h8kK4nBL+KvIiNGXywjJcwWB4/foY/R8/C77qgrtELzQxD+nMf
         RcfA+YBF4s01xHrXzPmymprRm5pMC5/oljkBiMSUvJsPvwzL8sLcsnCTfH+Hd0HYDADm
         4jRR/toU1wUAQyICuT1KPfow9/91qQbPkwoAkYnzSfMy7S4ggoApXi3YH9pjQw0BZ9df
         5nnxy2qj6yNELfBMW1eLE9dVNhdnYravuG+8kcU/LAa2cJjZq25wRXxvyT85v0Q7M6l2
         zE1UUZd6fCk8ZnXbaXCPnXZhqR8Pzj72S1ma+b8/cNfwQIZk/7HyrATujUiFLdebCd//
         pzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sSFnpqUuUbjElix+JO0v+jouPkVBxE7R6M/+d3k0EDM=;
        fh=Ng7hQeoaaUVbUy6JbxbPVP5wmuS3a3EyS+EnS/srAXY=;
        b=EDCBIf6cB5uuZFgtcY5yKtLAjkwo5ExeaqY4QEqR0ke3bVtcVI00lctiC5JzPfdfk6
         bRHDst4USQBmTnnXfSlWX9meUheaU9nvKJwA/tgRNdAVqxCTgDXkfYknKJiRTKt+s+I7
         oKFoDseBbemFH3R8mVR9NhTJRTznS2jA48tiK6IVlIc4+YvGvUoYX9sMq1fhJcy081Uv
         x8jjlKgUPn0N7oK7zICWH2bksjAQGrdUxq3mqYXfSvQzGLS1fBJE8/DApEHRcR1+QUOO
         O/i8ZbZ3P/b4kDUr2aUqrwS/RX+KW6VhwoE39voJnw/K+QijHJYqtCiW9nFh+5hEC6Z5
         RGUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795661293; x=1796266093; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sSFnpqUuUbjElix+JO0v+jouPkVBxE7R6M/+d3k0EDM=;
        b=RZStdTq0/KWhsgaLcWelVgO0rfVN/AIjokPuIYlr09nEwdBHkcFLaFMsdzW7BkHetL
         TrDKVN/cTWJzYk71S7A4+NNtvQoP3fTbfFmvM43PDObmq4e8Xxy6WIJoZkDTK9IIUsIf
         w9JLTG4dof3j4mgJPFctiDJ9T5scHcr4koVZskvs/v6f09ECohStwaZv5MEUwEfP5mnI
         /g3RIu/7a5HYSdLBr9PIQGqSigyBJzfghlOrA1HmzbfehPa0QtlpFJqYU2GgRzZVInO7
         xWFhVUeHQIvyS65EnUyqjeGxAoPMutTqJB8oRMUqZUKtwIB2fYuQluYoAPZrjP7DCQHn
         fVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795661293; x=1796266093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sSFnpqUuUbjElix+JO0v+jouPkVBxE7R6M/+d3k0EDM=;
        b=k9Q9b1Zf5WW1VY7FyAl0jR9PBQJ4CwUi/mozUaIhs3Bty41gAG/frU5+wSDZeKtz1c
         f/fdgs3f5Dcrg+6f4L0eXSPi2mnzJ4joNlzy/bJ5spgxaKi4zmvN6oqpqK4W2gv2nMqS
         XGJhsenusjCCQaz8qrrqeLaEf5cjRvZJjz1Ho6P6J9stWgg0WzuJ/81T8vVvIt5zC2sj
         oNy2Jc7rYfqKIjpya5N7G9ILEQeCef44H6jjjviK/dW4fuwV9M+Z0CyD+wZoi4fIkYdq
         7LlGBDUsPRibizqmTQMt46BtiH1gO7KUXqzdBv7r4XrlN10SxJws8BO+in4Dq4ryA2wb
         T97w==
X-Forwarded-Encrypted: i=1; AL+hErFn4AP9lzZ7pesGPhkPvnjX2rAGD3CFRXXsXKhX79irVI0MFPeffj9JACRuxTnNsHymed7lN/Q93faZ/D8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WrGIIXqvjZmo4pCcxd5R35ov9fkaCoxwLlQVS4jzLlWW61ss9
	ZD497jJFHHRZkgT0ilOLJJn7dFXgFKJmL0swhESeFkket/kM4Jx1RzavK4jpCDJNoNd8FGigKUf
	MnpxtWsPWc6jFhHHoUbx868M93HpLGINHcLqcFT1E
X-Gm-Gg: AZFdTZfp0GV5vVkUmmEtqihbmEZmyERL7dvAEChxuj8JI5MUIXiSdfLr/YALOXwT0WF
	rPkNHX34M1ewwdYiOnd4e8GLrUZycZ+EEks/LZ6TqRYfPiPSRDgreffRBCDMI7L+Y7/cxikxDdI
	RRDsZMIb7c7q+psoWanPsQ8mLdUvs12/W6559YvjYAIC2+2ngB3oWByHXLCVTMyZX457STfm2W0
	VxPs1UQtk7c5ptVhXWazVRl0NJV7kMixS2SZh/kYiQWBSTh55R9PBSZU/LBpyf6jbxSIkVR8pBt
	a63TiHinRZN0Q2jUoVX3+PQG36Qx2FfjES9oyUqYoETj5gsHO5TlJMFiUUp+kDoEb0J9hM7ZKl8
	485j/HUZy0IrUpNOk4FdR0eMOJlLh/yI/5PkOSV+YQe5LhOT1jB5r6uLmTHzOUfYGy/k=
X-Received: by 2002:a05:6512:3d14:b0:5bf:d54c:c189 with SMTP id
 2adb3069b0e04-5c1bc660a0dmr6174968e87.5.1795661292818; Wed, 25 Nov 2026
 18:48:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110020632.4003499-1-svv@google.com> <20261110020632.4003499-4-svv@google.com>
 <CANRwn3S63O+WRTGhpcNR__ybSuYUb2uEJavUY3b9Uaa_vEhWXQ@mail.gmail.com> <CANRwn3QjnmnhJP2y7tihZWrvgkdT9PG+qGaNbEW=x=mgUP4OHg@mail.gmail.com>
In-Reply-To: <CANRwn3QjnmnhJP2y7tihZWrvgkdT9PG+qGaNbEW=x=mgUP4OHg@mail.gmail.com>
From: Siarhei Vishniakou <svv@google.com>
Date: Wed, 25 Nov 2026 18:47:56 -0800
X-Gm-Features: Aa3M54rOxoiOvBSclEq7_xDi6e9FQMltiQKQ215JTx5OlREUy9W3b-zaJJ0tzEE
Message-ID: <CAKF84v0trQ5gpW9ceGmjGF-_Sh7vgitoeoqxRNZ-+xScnYU4MQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] HID: wacom: report ABS_TWIST alongside ABS_Z for pen twist
To: Jason Gerecke <killertofu@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 24 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 11:3=
9, Jason Gerecke <killertofu@gmail.com>:
>
> On Fri, Nov 13, 2026 at 3:29=E2=80=AFPM Jason Gerecke <killertofu@gmail.c=
om> wrote:
> >
> > On Mon, Nov 9, 2026 at 6:21=E2=80=AFPM Siarhei Vishniakou <svv@google.c=
om> wrote:
> > >
> > > Historically, Wacom tablets reported stylus barrel rotation (twist)
> > > via ABS_Z because a dedicated evdev axis did not exist. Now that we
> > > have this axis, report pen twist on ABS_TWIST in addition to ABS_Z.
> > >
> > > Keep reporting ABS_Z to maintain backward compatibility for existing
> > > applications that support Wacom devices.
> > >
> > > Signed-off-by: Siarhei Vishniakou <svv@google.com>
> > > ---
>
> Still waiting for the requested inline comments, but in the meantime
> I've been able to test and verify that the code works as expected:

Thanks Jason for the feedback and for testing this!
I just uploaded a v2 where I had to rework the rotation logic - this
way, reporting "0" would mean that the device is aligned with "North"
direction.

Could you please re-review the patch? Some of the code had to change
significantly.
