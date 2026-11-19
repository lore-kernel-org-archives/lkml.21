Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795109669;
	b=xCieroTa/bJoITXA41w4RM8HcwScQxut1kSpPr6y8eU4cK+csolEzZYwJLWsWeQIDxH6
	 xlFMdrQArs5AyGlt0h8vaQcortHGZ3r8h57wJjTQHpTeAs9twjN1WENTOtF+ZK7KpJf4f
	 8FbQeozNtJnue9UwTeXJJCeLXF6hXkIQ16WKOMMXcPG1uEte7OjujxrN3EFQdB8SX+wWl
	 CfSqQqNDlGxCYLyccoTTWQ86XI3jAgUMiM5TqmEaudwTjy6FXrCGaSg3JhdDTIBgiVLdS
	 Mn52bk8rsl+tOlMWgbokxUJs4KGv53f7F2cLlB0fybvcsOYz2izWSjDo9iiXU45wkjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=m1EYDKjHcJ1IGh49gGW/JeuREp9e8GQDYfzpAeI0szc=;
	b=N9GRXEvAhguKMfBrmjuNSSB4F5vMIQE6G1BNf7cz+8bDivHgUeL5y6yx5sZBYU/K+iCI
	 9bFNeCFzC/+KhbloUha/HcUX8i4BBH16pFgQIu/vuJQTHUZhtEHbewsahQvSVFeBRtKUd
	 FYQ9LCSMmoe/Y1Pz4tImykYJ3Vncs5RyBrBYlPrO8iB8Ti1+/UAUbzrBsUQlUjsqDbGDt
	 ap20HNLdLgo6kizcmNcgX/aPCTeLPyYq7lxbHZmzPDPBPOH7FCvpDkYsDzjBZTje2bWE8
	 rivE6iVCg03txzSyQs3ODhKSHpgaSvkbirH1hSo5NhadXIerBFugqzSrKA44Xn9A1Hg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nGC6aRIF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF34606A335
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 17:34:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF34606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nGC6aRIF
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8a1f59d5eso2621067a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795109667; cv=none;
        d=google.com; s=arc-20260327;
        b=Vvp+Han/IFjYITSr+bXyvxl1+3h4poj7lncWbDkoXNtOKAREQ+VtZ4F2+HzrnTIp5T
         5mQ6LNlHIxoO1B+jM/Lwj4NKUA8jhFc09M6E9DfcL8jpD7NZ1KYeD5QVOqMvfbd+nuqO
         R6UhHsalOuwAZPtIHqcvASVbY+Hr3x4fLXgYkEjU2IeODLfbCm01HF2WoAahKA7sXGuh
         NK15wysGBALBqK6GRDxKoIL6W1IYgMV8TRPf5P0dW4YZhtvzBXz3M5EAKotOvTqQRR/P
         jg32vLfK8m1r47sO8/h5iJQbVaoWOOeolpg+1zUPfXPuTOvp1NHq+606d3AMJrORvjEZ
         m+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m1EYDKjHcJ1IGh49gGW/JeuREp9e8GQDYfzpAeI0szc=;
        fh=ugNS/+rmn7Fua+0abPXRV5jy9dwU3ZE8/Mr2D1Uiy/o=;
        b=LtY2Ry2WNuMjDOWc7nDO1V+gHD7u8rFQ5NebexBDXWGqTtBR9DG+NuRWSKirKV5yfM
         9/nToeNVpGF5BpWXZGuoRqPkhMq0ZcQWoGoZtgLGRCLFxd5o4EI3BhAUDX0NPjGcNo1n
         JNLmLeqGq4zvMIN42iffJyFlpTBD2tj/oQMWtEsixv2wZUZIa393pomL9oG6KP5CDXHz
         0gMROZ/ua64MzUo1BCDZGLm0y7TI3Ss0Xejo64BzNIpHsFJJaN7HOzGHw76nBnYAgdQp
         gHZfBc8yd7T7EHnNCMsZRmoqEhT6FdTnJN8pj/2kuS9hq9KQrqA5H+5C4rXm1J1ZpLbP
         I6OQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795109667; x=1795714467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m1EYDKjHcJ1IGh49gGW/JeuREp9e8GQDYfzpAeI0szc=;
        b=nGC6aRIFchP5t8lwJ/zVTOI/bLa8AV4FvgJg6w8MF9wmm1yRU1tUTokZFa/paaDJ8e
         5PUOtHahetL7iiRPD9uRZGlho38PnlwqF01pD+GRX36RYtqopRY+6tUdIUx/3qzL/D90
         5amQJu0ziL+hdep3ub8xpqOFUa0Nq+K1582CqDJ7KCIXsfa6geIe36gqovNyjbgAUMjf
         2HpGIgyOw12DPpv97GDYb45yfSyQVjodaas6oDy6hcvHkFleTSnYO0ogudCUxCFaFMOW
         LleZntAPokivShBafvD/8UUAi5Gk0sYRA3rFd7SRoFsU1qI4IwU8icU0s6XL5OAjoNTc
         ilJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795109667; x=1795714467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1EYDKjHcJ1IGh49gGW/JeuREp9e8GQDYfzpAeI0szc=;
        b=wFwwzepTzzCOZ3YwarfpvlYeqf2/mHhAVNQJ32UFmhsiY99kpMFOAYWO502MW1hL5a
         fWPl5yZsZWafkcC7zLfJavp9dw3fkO3r2aGamJ4NxTSMJg0jyhl5H0Pxinr5ZtM/mAKk
         rM2Dst4+hg3mBz4L9XDRJzy2BQhm50K6yZ+0Me7ldS643B4Bp42yFqkOCwEg6ugBQkX/
         om4yWjly/kU64XVmyRwMSBmKf4JURsg5+azmZOmzPvuz1KxTvqTzxtz9c0yO5B93mxee
         wN1ih3oDEQATPstayVEc2M/LxLh9f2t5RU0OLuvfbmVO8VR/sWEvR5LuRBqYS/pn4ImE
         rFnQ==
X-Forwarded-Encrypted: i=1; AL+hErEfDL5W3axYr6PiR/0YfAVoJW8achOvviWl/sFR5SxM2ELDeDXqBqdNVjY3AvrPeqGu23Z/yJKhWr/SNzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+L2Y2KRTsjPA83AAf46N1OeU1L8FVBIAPMCB7arIbeGIiNS8K/
	uoYWD/2+TE5G/aahk9xb7sz4scktdiXkFV0rXFz9Kp76i0FX+NlEgWFditOZMZUpM8ZNHw52SA5
	fOetr/yeV+LBUJj6DgMQv6LEwO0FUXF8=
X-Gm-Gg: AYBFou3jo4rJOD//oM8PSh8IJmlwMv4dfrJoulRwWTc4gVp/9wtnUbOI2WRuY+2B+eZ
	9Wx3ym3Em/TQzzGWbpSaqibKLX1NbEmR4oQ5VOE4uNSxJ6eASv2V+YHrfW29Xeoaw+vHSVf7jaK
	koKvMB7p0FGwDkhHgHP4CCtwoPvjJWSC5PTq/zSVN9L5C4tzBkI3xDJbl6jr90tDwsyeIlBYlHz
	R/XBgTAzOecHN62dUjo77SUgMHrFWleIzgDdTtaxJHEbrsN2U4rZr803nJCjOqryjSsdRkqSvJ6
	ShC7KYPe5NXHsJVXWz9Es+kJWJGrEp3jqVhGNiJpVzU833vjje5xvRQhA6WXmAKp/264KXzSfdJ
	g9I4Wc5jjpsoTblRljJKw4h6tjjLozdzVXf9dxD17ElelaNpYNgtMUAxVHVDbnx4v2iBSdA==
X-Received: by 2002:a05:6402:70c:b0:6b8:7d98:4826 with SMTP id
 4fb4d7f45d1cf-6ba37d5bf0amr50117a12.11.1795109666761; Thu, 19 Nov 2026
 09:34:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115180343.576773-1-koray.fra@gmail.com> <20261115180343.576773-10-koray.fra@gmail.com>
In-Reply-To: <20261115180343.576773-10-koray.fra@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 19 Nov 2026 18:34:14 +0100
X-Gm-Features: Aa3M54rix9St5Car4447U2IPLFR0HdY95bNJiBlGTi0-FAZstJdvxSGCP5IQDxw
Message-ID: <CAOQ4uxhjxp5sxYphWoB=8sgX3XHOv9zLVYf+8ZjYbS_gQDxO3w@mail.gmail.com>
Subject: Re: [RFC PATCH v4 09/10] ksmbd: add provenance time (ptime) and map
 it to CreationTime
To: koraynilay <koray.fra@gmail.com>
Cc: David Sterba <dsterba@suse.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sungjong Seo <sj1557.seo@samsung.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Trond Myklebust <trondmy@kernel.org>, 
	Anna Schumaker <anna@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
	Paulo Alcantara <pc@manguebit.org>, Chris Mason <mason@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>, 
	Jan Kara <jack@suse.cz>, NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, 
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Bharath SM <bharathsm@microsoft.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>, "Darrick J . Wong" <djwong@kernel.org>, 
	Sean Smith <defendthedisabled@gmail.com>, Andrey Albershteyn <aalbersh@kernel.org>, 
	Pedro Falcato <pfalcato@suse.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, exfat@lists.linux.dev, ntfs3@lists.linux.dev, 
	linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:04=E2=80=AFPM koraynilay <koray.fra@gmail.com> wr=
ote:
>
> Implement provenance time (ptime) in ksmbd, as introduced in a
> previous commit ("vfs: add provenance time (ptime)").
>
> Map it to SMB's CreationTime, making it settable by SMB clients. When
> reporting CreationTime to clients, prioritize ptime over da.create_time
> memorized in the user.DOSATTRIB xattr.

That doesn't sound like the right thing to do.

If the server stored a CreationTime that client had set, you cannot
override this.

When the client sets CreationTime, the server can decide if it can and want=
s
(may be a policy decision) to store CreationTime in PTIME and not store
it in user.DOSATTRIB.

Fun fact: the user.DOSATTRIB format also has a mask so storing the
creation time inside it is also optional.

Thanks,
Amir.
