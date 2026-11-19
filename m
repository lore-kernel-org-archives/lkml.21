Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795128756;
	b=dsT9YU6JI+ou7iomLKB6n2YwhZX1ieaPGkI7SdUtji7I1WNvMTdv2teijzZ18/zcXfx6
	 bZX2Wsyp5gs12cBp+6cYcudBiGB3aZ3urf2fMcS/ZnZv6oGFmMgR6Qfo2Heaxp1FZC4CO
	 VA0pwlirm9vz1jCFWN+36g8n4/MlC6tK2lllt7eDhovmyC3vfaBult17kaOq0VlIAS969
	 LAhJaoJq4Jp05aLx6I632voGrh+oThON7fHeUJhqwuVVs8oCEFST5nRF718r+HPXC+QQC
	 AZ5ae5m+8ZljYJglXImZcVMJH6WU0snoO+9OnVHY9FteS7h3+Xk4MwYCGfaT+fL1nKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795128756;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4p/PmKLFKiTziuAYSkvBfkppOdPY2FKbz8KbdTu8xMs=;
	b=fStgQ4gwzHinpnVQ6NKGMr3Tpf6mECkkRlTdst3fHXi/yxIJ+/jAK2dAFe+Lvm3iAo9R
	 vfatbM5JJgnc/RF1qscM5sqiVpAStuOn43dznxs0q7ObisVEwUpPfp6ZHHRLUtJ3b8py/
	 AH/BY+Dtz3nRvE1QCrlAnEB8VeNipbLDDNS8dQ9X9MrY9w0naBTItHNuLdp+aQKt/vgaj
	 GD+cdbk2NqSrFowtkvSF8jB3md3dEcYCRrD02zAAwafxgFsrcesLz0f2zr2osQH+oo3R2
	 jTir69osWsLTKG/+kJuJiyi2N+HsVj80/gJnan1vKpfxexPYhkwkxyiN9BbQwACQdQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLzMGv6Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B928606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLzMGv6Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E291F000E6
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795128756;
	bh=4p/PmKLFKiTziuAYSkvBfkppOdPY2FKbz8KbdTu8xMs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jLzMGv6QSLDRuuYdmlrWyDrqR4/7yaIA4DiuD/TJo+ltbFdpYlnKD1ow6MoFtHmzU
	 31MDSG+ayW6stLEOadA9RWrGOQ+I96C1UpjULxEKqoVL1cX+R0z59PG73lkV9i8StL
	 Oj+EfazBd2TGtXjM/kKlP30H6OZPATnmtIKke0/nehMlxkfCb5hvWdym9Ib28gCuGg
	 TLVjdP22MXAAXGH0tbumy9ZhFMz9X9aaDvzt9CwuPfKq53We+MIFBmpvv83JqhaHMM
	 Sov1cwLZaff5BXyOowvKrTyvcB6KLO+KfEaB3nEisSyt6sFCl9WQJSwSIJtkvp74WO
	 NzyPYYqMHk4WA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso149065e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:52:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEngV7JCiToOjE7Lh1OuXGKVp35U/wt4wql/5mbMyGp+OpvJSfYiBVZXB5kHPe7daW+2y36lhgdsrZojo0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LEWB6dHDhe/nCmeW8mWF6nHeUMXsXrifYTexhpL5Phxx0dGKK
	Ft5ENV8FCBll9p5InTBO4gygvUFfVwo7XhpbBc2L8Td31t1XJSbG33o3Jbo0IwRiYzPI01lNsvi
	npQkhnk5VQALK9T4OUg4t5BlXSlBFA338xqxkWtwh
X-Received: by 2002:a05:6512:6d2:b0:5c1:ae5e:fec8 with SMTP id
 2adb3069b0e04-5c1bc8f41bfmr282170e87.61.1795128754567; Thu, 19 Nov 2026
 14:52:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119104208.782900-1-halg@google.com> <20261119104208.782900-2-halg@google.com>
In-Reply-To: <20261119104208.782900-2-halg@google.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 19 Nov 2026 14:52:22 -0800
X-Gmail-Original-Message-ID: <CALCETrVqc+1bjH1bhqHee9bsUdk2B6314z7PMexbsnNpMhk14g@mail.gmail.com>
X-Gm-Features: Aa3M54orIgtW7gpar1jND6wqZDNNJFniZeT3SuBwbGzX9xy6w35wjatFfSpXNgQ
Message-ID: <CALCETrVqc+1bjH1bhqHee9bsUdk2B6314z7PMexbsnNpMhk14g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] userns: introduce capability bounding set for user namespaces
To: "Hallgrimur H. Gunnarsson" <halg@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Serge Hallyn <sergeh@kernel.org>, 
	Andy Lutomirski <luto@kernel.org>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Jonathan Calmels <jcalmels@3xx0.net>, Jann Horn <jannh@google.com>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	KP Singh <kpsingh@kernel.org>, Casey Schaufler <casey@schaufler-ca.com>, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-api@vger.kernel.org, containers@lists.linux.dev, 
	keyrings@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 2:43=E2=80=AFAM Hallgrimur H. Gunnarsson
<halg@google.com> wrote:
>
> When a process creates a new user namespace, it receives a full set of
> capabilities (CAP_FULL_SET) scoped to that namespace. While namespaced
> in scope, several of these capabilities (such as CAP_NET_ADMIN and
> CAP_NET_RAW) expose broad kernel attack surface that many sandboxes and
> containers never need. However, there is currently no configurable way
> to withhold such capabilities from user namespaces while still granting
> them to workloads that require them.


One thought (from the rootns thread): the other decent sized attack
surface here is CAP_MOUNT_ADMIN.  Which doesn't exist as a capability
bit.

A sort of horrible solution (but maybe not so awful) would be to
declare that the bits in cap_userns aren't actually capability bits,
and that you need the bit in cap_userns *and* the bit in cap_effective
to do sensitive things, and that mounting needs cap_userns to have
NSCAP_MOUNT_ADMIN *and* cap_effective to have CAP_SYS_ADMIN.

I want to sleep on this.  It might actually solve several problems,
e.g. controlling creation of ipv4 and ipv6 loopback or tunnel devices
or whatever.

--Andy
