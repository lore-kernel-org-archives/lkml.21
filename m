Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530391;
	b=sYJ/cMvPjdQQTaeuaEHoQuc+vJFpInFd4WBRqncJ93a1OCWuAvhkl6N5vNAtoFUkG84v
	 VbHJ2NzSzhgMPCPY76PnKRuMtgRQcImCUR209naPs44w7r9pWh+WgJqUQR7aZ46X3xaG7
	 2eB2/bc72DmigZLPy+bw67Bkr46YRMkxhxvn4t27PQKOEVFq9YQ1DRWhMR6sPUa3VIBCR
	 eG9KG9VZjyRmZ6pKoQvehwlqReRl9NmPRmEFA/bTcwLS0NxNCFWLda3UEKTVRMiB/lYDW
	 5RqMKypi1ySpDdQ30cbAHszUxOTwp6ypdIYiaM7f+Tfbzl0bZEtU6xSX/UWBI9GMokw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530391;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3db4StPoGHzLR3P8qIYajcunqsZlDDnwGfdWKFu0rXM=;
	b=xt+ehOdO8xbJ4fZsrVZ3kvlTk7SqsE6dM1/NgOmDnBjzVvmmhD6gifNQ6zUmoQ4IM185
	 h+fdNuxw4n+Zt0uneqo9dRGRtl9I662YJbqjEO2KkJWIxTGX7RcFpYMSOGjodB6qd0Lik
	 qbBidF41N5014oHmSKbnEU/S2DniQKKdVSHzP2WlPPYfY0hHPQ2jBrS4AHjG5Fzhdl1Wo
	 LR7h+pMFQUDzapGLlCOx9Xzg71S1FGXlW2TV7FKDUhFwt0WNTiKtCjcjCRJ54rzRKEyR3
	 XlY7vvKNRGqj7spaStslE/Qzml90zgILcEVwsKEovNgWkxJZqEhQIPQ7fBLH9Di/GpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dd4xCAHn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BB1606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dd4xCAHn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D18F1F000D1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795530390;
	bh=3db4StPoGHzLR3P8qIYajcunqsZlDDnwGfdWKFu0rXM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dd4xCAHn6W+ssv6VCVMk+tI1gQbax2JNZkUVEpYMJqNhdQZ+250kq6gJ0GDo9KbdI
	 /L5wFVfaew9CcT2OBKIlX1qLuwRyvHCgREaSXQyZHvsrGT75p/EKNOVPJTJXrrD+bj
	 Db5yTOFEM40zo5xtPkKHAQrWalhIBHbfSgdKVxDsSbwnw4pPZy0ampzczuArhILinO
	 tYjOxkaRzpN2lg7DAwlxvg16HJDUHaJ91hvF6umYT1gAz6rjpd3EYvh4DIW2MWm3vx
	 5VRZZHD9qC+ZcvQxYX2n706AGInn4o1v966ZVjHOSl6BugUlFdc8i8PtE2AI2wny/c
	 H3D50dYCt95Iw==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso43638991fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:26:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE1bRTr5+f/XO74jmkIrJLHKGCFWOQLojTJGYRPiz5RAfsFBOACfXgH3Nb1AwECDh1bo0UR/lQDOBWQZBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DM4lO7M3jmOClXThsMURACh8gulhk62s6/F5UiXZBE6hwFha3
	IygwXhD0yggyL6rwesWQ3NFo83LwtWKIMU4saFgSfg3iQVrVdtt0vNZ3htIEuza2DKzOsHHvQJq
	n25y+3ugs6kcqevSc1Niqg6H+mfCH6as=
X-Received: by 2002:a05:6512:3e1a:b0:5c1:4f34:922b with SMTP id
 2adb3069b0e04-5c1bc8726b5mr4143827e87.54.1795530388031; Tue, 24 Nov 2026
 06:26:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120194507.593601-1-sashal@kernel.org> <20261123212630.1203859-1-sashal@kernel.org>
 <CAJZ5v0gAwqHNkLGkoKx=mSxeC4UuHdpY=71O3UDxBK99WshULQ@mail.gmail.com> <20261124135909.3358923-1-sashal@kernel.org>
In-Reply-To: <20261124135909.3358923-1-sashal@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 24 Nov 2026 15:26:15 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iup0grrQ56mpAWPW35HP-a7mVhhqJC5WnOk-YRa7ha-A@mail.gmail.com>
X-Gm-Features: Aa3M54rpsJXDzvWdL1vU1NQNEl5zjEdyhaWjriTBkl_ER4Ug-kKwamW6cKuo9WI
Message-ID: <CAJZ5v0iup0grrQ56mpAWPW35HP-a7mVhhqJC5WnOk-YRa7ha-A@mail.gmail.com>
Subject: Re: linux-next: semantic conflict between the hid and pm trees
To: Sasha Levin <sashal@kernel.org>, Jiri Kosina <jikos@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Joshua Leivenzon <hacker1024@users.sourceforge.net>, linux-input@vger.kernel.org, 
	linux-pm@vger.kernel.org, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 2:59=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Tue, Nov 24, 2026 at 12:31:17PM +0100, Rafael J. Wysocki (Intel) wrote=
:
> >I think I'll create an immutable branch with platform profile changes,
> >so that the hid-asus can be rebased on it.
> >
> >Will that work?
>
> Yes. Once the hid tree is on top of that branch, the two
> CONFIG_ACPI_PLATFORM_PROFILE checks in hid-asus.c can become
> CONFIG_PLATFORM_PROFILE there, and linux-next won't need a fixup.

Done.

Jiri,

git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
acpi-platform-profile

which is an immutable branch, can be pulled into the hid tree which
will allow the conflict to be resolved locally via a follow-up patch.

Thanks!
