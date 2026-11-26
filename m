Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692949;
	b=DC6a4FusBrhChIwI2gDfC/5rl7YvfaccIgSkQ+z+eFDfAY/08f7wTGyswsbHgt87D4OO
	 aqrhoyIMzzZUu4nbx49X5M36h4JtdR0z1f046rXg+0xndA6fsjrCgoLU7NnvoV5TXckTC
	 iGeY3JfUWPQAOhzeV6jwckD0QcQS9j6+dTp3xF6PJUl8S48e9NSgEoYtuhocRWbLKmFhA
	 cg7E4NkWxKDmNBjZIf0WaNG5crTBnMTAmMRkkZZ+Ab2sp/umfyOeLmPzsiOmPsCbEhXEN
	 IiqjbQ58NJhlQqdBDG3KXi+V1emdwQNvFxK0nBqHT2HtlsE2CNi/50wfNgUSSe8Fjbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692949;
	h=DMARC-Filter:DKIM-Signature:From:Message-Id:Received:Cc:Content-Type:
	 X-Original-From:Subject:Date:Mime-Version:In-Reply-To:References:To:
	 X-Lms-Return-Path:X-Mailer:Content-Transfer-Encoding;
	bh=unA431ECd152U6n8f6THnMEinZ3zGjLNoHnn81At+OI=;
	b=f1SLs/YbjPqed0mwfKae7SnSu20jY6kczxVPbnOHdLxYqtjUTvzuvRAAmk/+BWfqN4wR
	 C89MSWdamJPsA8jobZGMvn0xYr8GBkNlEo0IHu88MdNNmXjSRrDJuH7jkz7Y91m9DYrz5
	 Wp29mYD9mdPI2gK82Op9pKt4y1nx/hDoU6JjQ9xf23ItdbjxfCAIlaOQ0DT9ToHATFR7D
	 tK1tvAlis9n6ak3JBbJt7QoAVmvCRsv+Qn/WPrKkp+jnFrton7YDjhWPn8ZhFazj+DvpY
	 3JBrpptinDbUGw5Bk9WO1D42ucpH4xsuKE3UN2txuIF4+qn6ECkVGucg7Y0ba3b764A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fygo.io;
	spf=pass smtp.mailfrom=fygo.io;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=c8W40cB1;
	arc=none smtp.remote-ip=209.127.231.16
Received: from va-2-16.ptr.blmpb.com (va-2-16.ptr.blmpb.com [209.127.231.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E85606A326
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18E85606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=c8W40cB1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1795692940;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=unA431ECd152U6n8f6THnMEinZ3zGjLNoHnn81At+OI=;
 b=c8W40cB1vYw9Avy/XFsyIrUx2SN8OuhPd4mL/ylDkGIMl2MEccqrqI6vJxJpOYowUxIsGY
 /URnBkrjzI4XGPevZ5w6gRShCRjw3iCptSXnL2cC0wz1y5a+eAap/2AdwrBKyWikjxUHZP
 r33Ml5H7cd6rt1udaZYgsFCIldDxE6fU/FDubd/vq7AF038HJY28ifZ6OHxgRtj/tmqu/B
 GjbRqQZj2abK42WQ3YIaqkDrDTxoQQ44Zlvq63w0I8LgeHFIy1zjchgJN82/LEof9kjxXL
 6lYwzxvSRkfjdEvbpaljYvRdJso+wKwgOe9+nuoJDFrgC7NZLnbZfuFYUDyXkg==
From: "Coly Li" <colyli@fygo.io>
Message-Id: <A7BF631D-A5E8-47D0-B265-73C220200424@fygo.io>
Received: from smtpclient.apple ([120.245.64.140]) by smtp.larksuite.com with ESMTPS; Thu, 26 Nov 2026 11:35:39 +0000
Cc: <kent.overstreet@linux.dev>, <linux-bcache@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
X-Original-From: Coly Li <colyli@fygo.io>
Subject: Re: [PATCH 1/1] bcache: fix use-after-free when waiting for dirty-init threads
Date: Thu, 26 Nov 2026 19:35:26 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
In-Reply-To: <20261105131954.1195428-1-fan.chen@easystack.cn>
References: <20261105131954.1195428-1-fan.chen@easystack.cn>
To: "Chen Fan" <fan.chen@easystack.cn>
X-Lms-Return-Path: <lba+26b08198c+d7a250+vger.kernel.org+colyli@fygo.io>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
Content-Transfer-Encoding: quoted-printable

Hi Chen Fan,

Nice catch!

> 2026=E5=B9=B411=E6=9C=885=E6=97=A5 21:19=EF=BC=8CChen Fan <fan.chen@easys=
tack.cn> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> We use multiple threads to count dirty sectors in parallel (read-only).
> bch_sectors_dirty_init() waits for the last dirty-init thread to set
> state.started to 0.
>=20
> However, after the last thread sets state.started to 0 but before it call=
s
> wake_up(&state->wait), bch_sectors_dirty_init() may observe started =3D=
=3D 0,
> return from wait_event() directly, and free local variable state.
> The subsequent wake_up(&state->wait) then accesses freed memory, because
> bch_sectors_dirty_init() has already exited.
>=20
> Fix this by using a completion to wait for all dirty-init threads, so tha=
t
> no dirty-init thread can still access state after the wait completes.
>=20
> This issue was triggered in our environment with the following stack:
> ------------[ cut here ]------------
> [30433.391386] Internal error: Oops: 0000000096000047 [#1] SMP
> [30433.585804] CPU: 54 PID: 48242 Comm: bch_dirtcnt[1] Kdump: loaded Tain=
ted: G  6.6.0-98.0.0.90.aarch64 #1
> [30433.718972] Call trace:
> [30433.722722]  native_queued_spin_lock_slowpath+0x33c/0x420
> [30433.729401]  __wake_up_common_lock+0xbc/0x118
> [30433.735050]  __wake_up+0x20/0x38
> [30433.739575]  bch_dirty_init_thread+0x1c0/0x1f8 [bcache]
> [30433.746169]  kthread+0xf0/0x108
> [30433.750583]  ret_from_fork+0x10/0x20
> [30433.755425] Code: 91002020 8b040284 f862d8a5 aa0403e2 (f8256841)
>      ---[ end trace ]---
>=20
> Signed-off-by: Chen Fan <fan.chen@easystack.cn>
> ---
> drivers/md/bcache/writeback.c | 31 ++++++++++++-------------------
> drivers/md/bcache/writeback.h |  4 +---
> 2 files changed, 13 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/md/bcache/writeback.c b/drivers/md/bcache/writeback.=
c
> index 4b237074f453..e74457a8c952 100644
> --- a/drivers/md/bcache/writeback.c
> +++ b/drivers/md/bcache/writeback.c

[snipped]

>=20
> diff --git a/drivers/md/bcache/writeback.h b/drivers/md/bcache/writeback.=
h
> index 31df716951f6..e6c74be20fc6 100644
> --- a/drivers/md/bcache/writeback.h
> +++ b/drivers/md/bcache/writeback.h
> @@ -31,7 +31,6 @@
> struct bch_dirty_init_state;
> struct dirty_init_thrd_info {
> struct bch_dirty_init_state *state;
> - struct task_struct *thread;
> };
>=20

After this change, struct dirty_init_thrd_info has only one member state,
I feel you can totally remove struct dirty_init_thrd_info, and move state
directly into struct bch_dirty_init_stat.


> struct bch_dirty_init_state {
> @@ -40,9 +39,8 @@ struct bch_dirty_init_state {
> int total_threads;
> int key_idx;
> spinlock_t idx_lock;
> - atomic_t started;
> atomic_t enough;
> - wait_queue_head_t wait;
> + struct completion done;
> struct dirty_init_thrd_info infos[BCH_DIRTY_INIT_THRD_MAX];

You may think of changing the above line into
struct bch_dirty_init_state state[BCH_DIRTY_INIT_THRD_MAX];


Thanks.

Coly Li
