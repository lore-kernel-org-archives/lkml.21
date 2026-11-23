Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795475420;
	b=GN+qwGRqNMilhATfJF0PqOuCwsM390Ptm4OLIDZk6gKhE2M5y7I7FfPpMgdg8lyy2RmK
	 cS/e11hVbbbjuLRonKAdZojDcbz0GnA8T1+iSY0uQFkU2+Jput9BzFtYNS33DqYLfjeCW
	 cCH4xR4bC0AKtpSpPmU/TeduqIJJt7O55BiHnBQkiZK1hMfbB8O/F7bJXdBzsFIM6XboW
	 YJlvzfczyJ0ojOcKieZpJldECuSZGCetgGyid2TMF+/dlXinSMNoJ2eJFI+Dxnp/VlLtI
	 4p812iq7+nxwTgtgkg2q/TOZ+jpRN7Zu6JaLVXQ0CMn3H/w3MM2bqL6Y+QK5BESohdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795475420;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UweiNxwHTgAt8ftm1WMDIgqwHu2JV76yvvj/0FyLrMo=;
	b=l8AnFi/1o4T+6FXSYw3wLuLRgN3RTdn3kubTIt0eWYP2rsWfHqOX8L4chez5+uatZMpD
	 Nybl79IVMxWiRdnWV8UKT/gpPadUAjf28xcoAU+ZyB9Dq4LLQRsDiOaGe7uAG6dJnWJg5
	 NY7pa6iGqmzIwyySwRXxEt/5zC1zR3pJXSD+UHbfiMC1MGsC74rVuZM5657PvyFXy3gbn
	 J+e4JpjRp/fQ7zGqXqX4Ax+/mpomBUmfYdrN1blNwuCXZN0hJIC+UOHg52kv9yS0HBQJq
	 M2299InJ2j8BUKW5A4qg3LMsoFQpU7KPh6BjWuzfLGSrY82HcC35AWcn2MaEKG8aEyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6y8YQb5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69AA606A680
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F6y8YQb5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1019A1F000D3
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795475420;
	bh=UweiNxwHTgAt8ftm1WMDIgqwHu2JV76yvvj/0FyLrMo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F6y8YQb5R0H+K2Hc21etiJHUrZmNS+nLZiGoMeKkKHhnodKkyiYrJAoy6X+D6qw4e
	 sl0MmY2vl1ChwZWCR7loPrRpUO/wCtRB+1lEdEsdgUHn8VQvrgr5NQ41lYZ/3tsR1R
	 4D/h0B4vKLBrfxa9yxCi5v88NGqY4V0j9KD3FNGp5e9vL1rsY4g4xR8hcjAFgsxCZr
	 GKiTGc+P212g+2GBWKvSk87IXfqVw+zk7hMAOawxvyP7V0lh/ko7euaCnt366i1wkm
	 IoUt7dh1BrZSd8X09rNS5D1r0FZ7kUyUhjB66e9rnNx+V0Ibp7oRs/rVxSdMM7uWTY
	 H9oR8Da4FB1ww==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so5118252a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:10:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFFmMsuMTBx5AgGvEZFBc+PLVdSlnJSarQtJOEFVBbnRDQtcX+uWxK3UhK5aK5n6HhRXaBC2pgOu4P6C2Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gtu7wKOfTZeLUow7UbkUwOmBTHhWIvEW58EEJuvMX9iZw6E99
	YzJbGmsdSIP0BnflEiq0+0/l9Sc3bWDgiTWdPLJg0HdqbUO+gaIyI7ZjllUpDiOV5UHE+XTQX1j
	/QzhCO2ohDAUOhFGx0b9kwKovvae1/zU=
X-Received: by 2002:a05:6402:210a:b0:6ba:4bf3:4a7 with SMTP id
 4fb4d7f45d1cf-6ba4bf3066fmr8378296a12.23.1795475418624; Mon, 23 Nov 2026
 15:10:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122160149.403491-1-icb@fastmail.org>
In-Reply-To: <20261122160149.403491-1-icb@fastmail.org>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Tue, 24 Nov 2026 08:10:04 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_4V=XDhnkMgZ7AyumGW+x86wxMwP8Pk-04aSYXYeHreg@mail.gmail.com>
X-Gm-Features: Aa3M54pmdqZ2Mt_rbU3GRlwVD6xqCo0bkVzkOT0-8D6p05zezDl8vNMe6n1NLTA
Message-ID: <CAKYAXd_4V=XDhnkMgZ7AyumGW+x86wxMwP8Pk-04aSYXYeHreg@mail.gmail.com>
Subject: Re: [PATCH] ksmbd: return only the control flags of the parts in a
 query reply
To: Ian Bridges <icb@fastmail.org>
Cc: senozhatsky@chromium.org, tom@talpey.com, chenxiaosong@chenxiaosong.com, 
	linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:02=E2=80=AFAM Ian Bridges <icb@fastmail.org> wrot=
e:
>
> build_sec_desc() copies the stored control flags into the query reply
> and clears only the DACL flags when the DACL is not requested. A
> SET_INFO without DACL_PRESENT stores the control word as the client
> sent it. Its other flags then appear in every reply, such as
> OWNER_DEFAULTED in a reply without the owner, and SACL_PRESENT
> although ksmbd refuses to query the SACL.
>
> Copy a stored control flag into the reply only when the part it goes
> with is in the reply. OWNER_DEFAULTED goes with the owner and
> GROUP_DEFAULTED with the group. DACL_PRESENT, DACL_DEFAULTED,
> DACL_AUTO_INHERITED and DACL_PROTECTED go with the DACL. The SACL
> flags and the other stored bits, such as SERVER_SECURITY and
> RM_CONTROL_VALID, are not copied.
>
> Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ian Bridges <icb@fastmail.org>
Applied it to #ksmbd-for-next.
Thanks!
