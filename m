Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630260;
	b=mCYgSJ8mqatokOROr4F7+Wky3CneTG0BTugdw1VzTu+sZ3dqvKuDGZud3XsZyO+yctJ1
	 ySTzU+C668LgJ/Sy6LxvW6rKNvUckZI64CWZR6S6qptTynvrAKacmEJq++wmnWuxneZem
	 in3DtQ8GXuQixVCPfhJ31CKsUoHlgPdla5w0hvMiKRjipa3ZARiQ967rTRTrEvKfqIzfO
	 HqJnRJTQFAqAbDGWPuAst4ni49NBcY6PXGag2P+6W0ayxmFwD/K0rfCm8aXx9xl73m8v5
	 LxlAt+xKIezCLZ5mwA7IPt8LD61ebSUZX2YkGlDeJvo0FlTPzl0ggDJKEsO3YyxsfBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630260;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mWutYmcI+akmXQxpptAbrI1MPXq/0LbtGQvDAhb+8lc=;
	b=TSMGrwOALKBdZ486G6F2MiC6tH8DJKosKzCh16o/gJ9ze/zincmcTK5PBq083WBvESPz
	 DJuI10EfrguFXXAgL5UvVgx9GUPushXgs6g6kk9Wfc6aDm9/40m0DWHzPK/2zInVnnbvG
	 oJYgT2HwgR6tjEp3jkBQ9FU6/mSq3AWQC1TIgJYXEMKYk9YIAs8acjraB2BfqUZtkec9w
	 PYaXeuTwDomhneRWkwdkRoLDgr7L7Wyx14QiU4vV679gj1sY0/INIo8LzEHlukEZZMKfj
	 fCqD7uhodtlATOadm6GP/di7oud6XZapd8MLmME3T5pUFbT4OvNZohWS/Zd6IMpa2BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cryOxmxh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DB1606A688
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cryOxmxh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A281F00A3D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630259;
	bh=mWutYmcI+akmXQxpptAbrI1MPXq/0LbtGQvDAhb+8lc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cryOxmxhtxlO1KGB/8E7JN8u0pgaKXd3JfHXEiXiM3jywuj6bBaW4BgKUhlY0vOn5
	 IRXgAVvaQEst61cU10Xf9IbAPGIF63V0ngPxRuWlorWxW/PXrORyW7RMkd+6gnIj4I
	 sNBHuTav0OQ+N1FYkaYGb6y+HMWlbi09hcM/yHFxVfOF1O8AAyvTQl74HE86bBvMe1
	 nAPONnqT8P7FU65MTtfMdc5sgAR86zMi9+zJCrcug0m1cp3GT9Qme9gYiu/dp8nm1Z
	 jvxQ/mOzqfZLn2XIk9nSCZlxNvF77m00LYYlD1MzR/STyzH+FDQA1zPn3MUzFUAuCj
	 YmL0d19DIxg0g==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adf9b1f5aeso61229921fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:10:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE42b2iPdwVr95n5fkOj33DGB1olTK2E/kC2Gh9NVryfHA2vpDK5LwKsQrCNavFk2S8s521voAegNeCazM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fS9HRq2hny6lSvqNyk3/MG7yLGhl79vS14zaZ5zbBB5LaFbkZ
	98kefoq3/GEqrmYtgx/kCfBcjBrsBxCYTsW2iEeMtU8hYBfZKqJSwCTIBYn2spUI8f0j12w+3K6
	HQMhDT3+XniGCOru14CCawG1tdptE5xg=
X-Received: by 2002:a05:6512:4018:b0:5c1:56f5:da02 with SMTP id
 2adb3069b0e04-5c1b79fc73emr5241671e87.1.1795630258316; Wed, 25 Nov 2026
 10:10:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111114225.3977243-1-ruanjinjie@huawei.com> <20261111114225.3977243-16-ruanjinjie@huawei.com>
In-Reply-To: <20261111114225.3977243-16-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:10:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLkCmejeNE2dZASY0crxe-Q23QJ05fqvEvP69YuJrETYPw@mail.gmail.com>
X-Gm-Features: Aa3M54oIDRMFXP1RpUMFXoUcM7tXj2uiaN-FyRQN7L3lknX3zpF2wKbegX-ttpU
Message-ID: <CAD++jLkCmejeNE2dZASY0crxe-Q23QJ05fqvEvP69YuJrETYPw@mail.gmail.com>
Subject: Re: [PATCH v21 15/15] selftests/arm64: Add ptrace single-step and
 rseq syscall-exit tests
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	oleg@redhat.com, shuah@kernel.org, kees@kernel.org, luto@amacapital.net, 
	wad@chromium.org, peterz@infradead.org, ada.coupriediaz@arm.com, 
	kevin.brodsky@arm.com, anshuman.khandual@arm.com, thuth@redhat.com, 
	james.morse@arm.com, yeoreum.yun@arm.com, vladimir.murzin@arm.com, 
	broonie@kernel.org, ryan.roberts@arm.com, liqiang01@kylinos.cn, 
	mathieu.desnoyers@efficios.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 12:43=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:

> Add tests for the arm64 syscall-exit and single-step behaviour fixed by
> the following commits. Each test fails on a kernel without the fix it
> covers and passes with it.
(...)
> Link: https://lore.kernel.org/all/20200710130702.30658-1-will@kernel.org/
> Link: https://lore.kernel.org/all/20200524043827.GA33001@juliacomputing.c=
om/
> Link: https://lore.kernel.org/all/1eed6d69-d53d-9657-1fc9-c089be07f98c@li=
naro.org/
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

This patch also looks like it should be sent in tandem with the other
fix, patch 1/15.

Yours,
Linus Walleij
