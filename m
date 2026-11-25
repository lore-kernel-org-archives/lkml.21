Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795632247;
	b=5FG6LizDZ9tcpiNWmfviBSjx4xT8uiUcJOvhal91pGEcvSlIsguHFrUXWqL4SYDKoQ6r
	 RiU7tUbbuHNbedxk2wRel1/yiqEX+7+8d9NmUMxpATYSZgEmlI/mWFFXcBh92IWYnoVUY
	 qIIWLuiM5eDiflW2oEQqRe0b5YNjfclKFUD9Nhr5x4qZbhhLd1kp3OcN1xzis6W/1phE1
	 G0T/6iHz9C58UieKFDVp8hBF6/fjtEq4AaKPb0zdetU/PbpOFTHViMHZs8dv3hTggS6gx
	 sz3bFpYpN5vw6EzWjSN97rbLAjdXQzr5HHHkmASokcIE2ZSmiq0t4SPPuHR4shO6TAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795632247;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z88aGwPIsjieg97Hit4hBKSS+J9QlhpwflV2QuOiGvU=;
	b=DYjRkS2yaThDvG2WYLRnWYgooMXL0GHWBYmjd1XBVdxHaQG6Se7I66Vxbohe2uoJRL08
	 4d7S52qgDbJxof4x4Kz0IAdZxolox6Qm4RxqrLZrd9TU2ujha0REr/eH6GiwnCVXwIZbQ
	 KPpheYjOg0ngz2NvuDuKKFE72HXvtk+bNTrq8f/dInUgabY+fda8/f4M9ASj3VehCpCmb
	 VG6UVFPVFYlXDA+ylXBHvRBaDRPu0b43rDAsK27gVqdrdj0faiB3D87K/7aAVS8ZDEnUi
	 bQ1KX8lnnZLt0WdrsahXtDpRe9BHV3jc1WmObUh9dGT/rIXKYkz/84X302w1Dj7tPtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="VYUKE/H+";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7900606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VYUKE/H+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAE51F000D1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795632247;
	bh=z88aGwPIsjieg97Hit4hBKSS+J9QlhpwflV2QuOiGvU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VYUKE/H+ze7+LIVZKsJMtgxO2LwFwTbJszutLPd0SoGvQ/DhZ5UOlg2cuGtj51Y25
	 BhuEYDutYwdyeOd6GsKCux3CgbhRktYCdDY6j4rFNfujjeGyZ7VoK4wtpigL36EEzZ
	 7W1Cq+Rj3ps2bTdL+om6F5P/xtuS9Aorivy1hTdi0s/kIj5ouNU6m3IFlgKWnncAjI
	 ms/ig8kiiX2umSYM785x70QATxuwCJpUEn7K0QWwXPowa9iosE/g3Z2TcozlHeK62T
	 DKwlI97bulmh+gz249hoQnmV5jgNc/TYvGABZuCf6t8yiLzKO6Gi7weiNhQgFrKav5
	 O/Da7IH6yc4Lw==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3acd239776cso52803631fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:44:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEgwS0NA/ebE0+p23R23al7P5xBjgPMa24ks+40cRrE7YCrpH08XCUDjV+jkYEEUBuK4hRKWXVVB5cfNqk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ycnizZwCvQy8KOIJ4UrUgqInUA6jyeBurw0BsjoFc1O0e7q0X
	E7Z++3KBVHCX1caerV1UOzgBQ+LBfWXvZLgn1yxKkwJefVmm30dMJp1x9HvF5bQwbR7mgvzvOY7
	Od7uX3TzMggXMHMupw1FRZ+RR6nMNSWY=
X-Received: by 2002:a05:6512:a345:b0:5c3:235b:52db with SMTP id
 2adb3069b0e04-5c3235b541fmr887496e87.39.1795632246205; Wed, 25 Nov 2026
 10:44:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-superm1-pinctrl-power-improvement-v2-1-3b294116c835@amd.com>
In-Reply-To: <20261111-superm1-pinctrl-power-improvement-v2-1-3b294116c835@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:43:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLmuAzLD7grswJgTQurJ9BYJqEL3pYzSPXa+qemBgWHhsg@mail.gmail.com>
X-Gm-Features: Aa3M54pfJxk2k-lMiewwxJZsIRlDHOcyZCzrE27YbgJRp0NkyRZyxALSJufZgOw
Message-ID: <CAD++jLmuAzLD7grswJgTQurJ9BYJqEL3pYzSPXa+qemBgWHhsg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: amd: Steer GPIO interrupt to low
 power/efficiency cores
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 3:43=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> On hybrid x86 systems the GPIO controller interrupt can be a frequent
> wake and handler source.  Servicing it on a performance core can wake tha=
t
> core unnecessarily.
>
> Prefer routing it to low power cores, then to efficiency (dense) cores,
> using the CPU type from the x86 topology information.  If the system has
> neither core type (non-hybrid), leave the affinity untouched.
>
> The placement is applied with irq_set_affinity(), so userspace is still
> free to override it.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Patch applied!

Yours,
Linus Walleij
