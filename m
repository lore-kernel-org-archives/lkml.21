Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795561800;
	b=RqRDpPUmlnvvY4f2ZPWOq/r0sKzcohjvwH1NWa9CC07NefEi1+Dx6j6xcRQfFlFkhKi7
	 RSSRfEYAeCTfaqG9eAriCXXlvRxh+hHwAQFKsAQ7cY+aW0Spl0uX01Yk8wEyoH5IT8PER
	 Ux2B6nGTa1pZyeln5XInhFkGt+VwcX6nOE9NnHJ8TwZOYKNEulgbnB22/fh0qQelC+nOx
	 LaXtvm9fivZWaeRsxJZHSxwNKZynCWRC5x6LBGy/eMKfW8lEGK+Iex9xlY4JSPHb7wFc3
	 TcGRh7JCdnseqXnah0J7CKEPFNyC3UOrEvxqVubE/ZajLOLs12XKkiHd6hhm4AW0o5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795561800;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jhT8LtsJSb8QVNl46dCzwpIOZ7q30r8sf5zR/55MKKM=;
	b=oXmdJA8U12zE/9vyT4QyrluQGzHKIzap2g4C6BJGZoQG4XD0bMC1ygWxx0JyvZnK+HvN
	 Q7Yk+G4M5sqRbC+hwzY+l8lX8DL66kxEu+QFUU+dL1ahJtzdZNm++wqGyS1FZysjwDARk
	 CEy7prj1rZCPgki6OC7VTtNL6YPNExMvq+S65bBIzX2JtdefHnvZGvLxxfSxqhyOnuVnQ
	 D8t7pPdcyPJostaUcTiHRczga1Kn7TmA/6CFY8L5BRikYp8/e8fMkhQ77tAIjYOFvzhvR
	 9o8yoH645IBC5PHmtKSk0cHd6YaV1NT8xVwakgiGTYeaAf9J6kaBDXy2i+RU0V1gMMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bamJArbo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460AC606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bamJArbo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB67D1F000D0
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795561799;
	bh=jhT8LtsJSb8QVNl46dCzwpIOZ7q30r8sf5zR/55MKKM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bamJArbo7ASD0ch4tNodbHkx8EQtb+DJUX60p4N/YmRXW/YVXWsR57x0KDvK2ZNkP
	 hrf5D/7G1gY5HUR7c9Ewfebw7h45a5CO7naO7erqzGHcewQUNFrrJ/jT/3W+ONUSIq
	 lJ1JZg+PYHpkbqJU1qZyzvUS7YlOg9EfZnB/3L/pb70XBYXmsrewlDqXZRwotqHVgT
	 8AT7eeEQLStvZFUbrhcnNLeN2tsK5ys065gLlubpZxlVjmcSLiBmsMWCDd4n4OifMI
	 XWYVi31fht0Dlvl5TRMdzMFTE0GX/us5/6YJ/2quNfOg78QLMW5UnBjIru4WMg9Uem
	 uewXM3qgwgJrg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c50aaad19fbso565364866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 15:09:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEEc9v/KDog4GGi7YspbO27Zov0qrjxBBPj8ULO0hUPWo1FHxE5cfOFouYOctE936Fmjbp5bb4mK6+qJI0=@vger.kernel.org
X-Gm-Message-State: APuU4Z93RBICSgaZLyj2bJVXnocOyw14OwgWD8mQEJ0zB58yZwxFpcLG
	1jIWLgeblPmnaJED3RgwgKNEafaEf8AjNW0NCbmn5fiBoHOJzyNNrUGtx/i/QhsNRCK0/VD0Xy9
	QKZ3UJFRq6xMUWWwSHU0/0PpQdxJ3cDc=
X-Received: by 2002:a17:907:9306:b0:c3e:e677:5608 with SMTP id
 a640c23a62f3a-c513a5da8d0mr1279513666b.12.1795561798427; Tue, 24 Nov 2026
 15:09:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124174726.2223430-1-sashal@kernel.org>
In-Reply-To: <20261124174726.2223430-1-sashal@kernel.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 25 Nov 2026 08:09:46 +0900
X-Gmail-Original-Message-ID: <CAKYAXd-DRpoYgs0sAKcQEOzFRgV61xw25iw+Bpd7J_y3WvP_kg@mail.gmail.com>
X-Gm-Features: Aa3M54qY8g7RrUxDQKkEFmIukaXDceRIy7iERNeOs12-ZdsiYHR6ozBAnFpB220
Message-ID: <CAKYAXd-DRpoYgs0sAKcQEOzFRgV61xw25iw+Bpd7J_y3WvP_kg@mail.gmail.com>
Subject: Re: [PATCH linux-next RESEND] exfat: check the emergency state in exfat_writeback_range()
To: Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Chi Zhiling <chizhiling@kylinos.cn>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 2:47=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Since next-20261119 the merge of the vfs-brauner tree with the exfat
> tree drops an error check from exfat writeback.
>
> Commit 788f21d1f192 ("exfat: don't set SB_RDONLY after filesystem
> errors") in the vfs-brauner tree switches the write side shutdown checks
> to exfat_emergency_state(), which also fails after a filesystem error.
> One of them is in exfat_writepages(). Commit b900c61a3f21 ("exfat: drain
> dirty pages after forced shutdown") in the exfat tree moves that check
> from exfat_writepages() into exfat_writeback_range().
>
> The merge takes the exfat side of exfat_writepages() but keeps
> exfat_forced_shutdown() in exfat_writeback_range(). So after an error
> with errors=3Dremount-ro, writeback keeps writing dirty data to the disk
> instead of dropping it as the vfs-brauner commit intends.
>
> Use exfat_emergency_state() in exfat_writeback_range(), as
> next-20261118 did.
>
> Fixes: ce0505a38004 ("Merge branch 'vfs.all' of https://git.kernel.org/pu=
b/scm/linux/kernel/git/vfs/vfs.git")
> Link: https://lore.kernel.org/all/20261120003508.2135492-1-sashal@kernel.=
org/
> Signed-off-by: Sasha Levin <sashal@kernel.org>
Looks good to me:)
Thanks!
