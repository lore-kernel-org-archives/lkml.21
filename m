Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270150;
	b=qgKHL/jxIdSrVyp0kWy2bcFpmhJRWQqUQJTRXayAVsEE+8I2B5LZXxlHRlgOEDiY9xRo
	 aCx8Tkn/UyxaHUx2bJJjwxGHKqhylPK2mhL5sULNpUzm+AqpFcsJhbEsjBdPZOKJAvhIV
	 jUca+YlxNtfDcMxQOsFmhLmUyp6maKINBoh2Lalmqlta4lRjR2bR4AyLXNIJtMGXdBt6e
	 GoOkuLFhl/xZD7/vym8l/+sZbvf9vXh8i7OLjHZ0L1MGgPXhqv4wR4u3Kp2cQuNOY6U0G
	 lsI4/zc/AvNzwkZgBql7mKhPFE4LzAPJLgCUEiL3sVByfnXZY+6UTxDQRnERGJx4LoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270150;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vHYiioNpF1NGJmY/P1Pd4vnFnoPCtbj+gizOvrXBmA4=;
	b=Jsk5q5qiu0kPyFy0wic4WlvpzpU4c4xO11kanmA2IV/MA/SW8N8Btngv0mWzMEjCawud
	 gKWjftKknRBLWEx4u2/8++xE0guBY3//WU292cq5dhfxHwGyaKQiQzj7POL6hBx4v1PjV
	 XG5nPzKqdMaDhzIejI8Uka9YG7NzIN9Br71PY9rLwiVBHFMk5vS/VwkCSGn21xdpCK+3n
	 IPNpoIbyhbugIiUHc+57uamle8gnmBoSoblvA0Rq4tHJf/HooCxjxPhya+7c7+ExHwISf
	 rZYl6F277wjq0w6Qgup4nHAbYfqbwCJ8dwOi8KUpgAr6rFOAzi+gjRT7Wo4o1BfV1VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLlJPcLw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EA3606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oLlJPcLw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2AE1F000D1
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795270149;
	bh=vHYiioNpF1NGJmY/P1Pd4vnFnoPCtbj+gizOvrXBmA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oLlJPcLwgUqmyDuXvILgBFW+uggSg2a39l91Emz31qIlaR9U6+GklY5Mmp9REhI+T
	 rmFtBFSxfpviU2jyA5BlyoTn5DqbKMKzKgCNsImL4dekaZqQAClC503uFmiykI25v9
	 Xw6ymwMADvVwMh+Jo2RgqO/Oh+tDnWLIKCSRa0wsBXASuKem9BE8cDojeRm/KNryxF
	 Gyb7eZz+SLal+kJFFmNwlXtkMOXlX5VcEow98PRdvPu0MeACMSH0vHYkLRahYyADn7
	 kUfLDWrqie0SQLjWRuqdk5H9pvmQ3clgQN44fkqMugK+OeK6XS444Rot6ZuZacl3cl
	 /zjPcytSvFJMg==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c5127c7abd5so307194866b.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:09:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHwR8kvyXvaE7IiBnTLjzrRiA2ds0bUgAn88Tn/1NbfPQARlewyctb26jmnF7n88CLs0WXvhiScQA/6si4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9HxexClbe18LjMpTNhwtx2VuDS6WxVWLZHNjDi0XP119AC4X2j
	Uex35ZIzc7Rb1JFt6YSjZrmdXcPCG2pIop6lqCLbeMH0ZfC78tZXHJYzwssyJC+EFCF2XY0E9B5
	BIP7oiGedttWU9izqdUVjdRYrzmmYDTc=
X-Received: by 2002:a17:906:15c6:b0:c40:231:6eab with SMTP id
 a640c23a62f3a-c513a5eaa3emr444289066b.16.1795270148311; Sat, 21 Nov 2026
 06:09:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118090701.1858849-1-wangxuewen_ky@163.com> <20261118090701.1858849-4-wangxuewen_ky@163.com>
In-Reply-To: <20261118090701.1858849-4-wangxuewen_ky@163.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 21 Nov 2026 23:08:55 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_-uG6Y+h6-=xkCBw1E24fSDAFeAWzKuK4qSm7Zr6g35g@mail.gmail.com>
X-Gm-Features: Aa3M54oTJdzV2212nmgx90b7obSSvWMrC6fRe-ifuKwo-NflQJbozIao4xW-XkY
Message-ID: <CAKYAXd_-uG6Y+h6-=xkCBw1E24fSDAFeAWzKuK4qSm7Zr6g35g@mail.gmail.com>
Subject: Re: [PATCH v6 03/37] ntfs: handle source record removal failure
 during attribute moves
To: Xuewen Wang <wangxuewen_ky@163.com>
Cc: hyc.lee@gmail.com, liubaolin12138@163.com, ntfs@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuewen Wang <wangxuewen@kylinos.cn>, 
	Baolin Liu <liubaolin@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 6:07=E2=80=AFPM Xuewen Wang <wangxuewen_ky@163.com>=
 wrote:
>
> From: Xuewen Wang <wangxuewen@kylinos.cn>
>
> ntfs_attr_record_move_to() ignores failure to remove the source attribute
> after copying it. It can update the attribute-list reference and return
> success with both copies present.
>
> Check source removal before changing the list entry. On failure, attempt
> to remove the destination copy, dirty and unmap its record, and leave the
> list pointing to the source. Record both failures with the existing volum=
e
> error bit and log messages after releasing the destination search context=
.
>
> Shrinking a record to zero needs no extra space, so failure indicates
> inconsistent record accounting. Return EFSCORRUPTED even if cleanup fails=
.
>
> Fixes: 495e90fa3348 ("ntfs: update attrib operations")
>
> Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
> Signed-off-by: Xuewen Wang <wangxuewen@kylinos.cn>
Applied it to #ntfs-next.
Thanks!
