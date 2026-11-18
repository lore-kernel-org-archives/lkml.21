Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964523;
	b=NF1b9gmCAbTA0LmaPfgIh5VN58wkpvN5siv23+jNvDBuha+4vn1OgBQwZWP4LsalqYe/
	 TDFXdZQBI+TD0ptd0XvM6p4iTV87io1uoVoE/6F55nIpuxtZu3RUwtGMdRZfmwGdwjiHg
	 S64VZXwgwkvGMVHxcNV+k4SzUDjUoGgObSjZxYycVMmv18dVyklyP48xhBMm+1UYK2dCD
	 lDZmv45Sm8olf9jqUCaWIU40kuLYRueogrivuUYjee7oMgzplb3zT1KY2fYXPkNfKym4W
	 +jDTVohnA2kc9x+DjyALSj8sQ8FFROFuIqiyhbyfzcS7xbYzkmMRV4Uil2YVu7WGv2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964523;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ei5zvsY36hyX76GY8L34lt7H4EbEz5X0q8+ZsGkzAPg=;
	b=f/TC1cL8NwyBVcs2DTLJfIihHRlnK/9zPOgjUQmz76QVpna7ONQxmfZ7HADGrlgOdARj
	 wlu8tcp85B/IPOEk+JPG13CNKxj88Q+xEFSzmKDm+kW+8rhvz/8O3v9ieULXC2FFWjXa3
	 96ThkBXP9jmwDq1tL1rIvBP1tONShH7v/EfmxHd5b87046pVXexbm1iPEvMXaiUt6gvFk
	 Rzb8YZ6BDW+yiWafiYs017UdcpPjW6WM31G7KQWUXr/EOnsYw92qq1wqwGiANyTTVS76N
	 lm+x5ajaPemrbYayOXux3y7fAMW7VmpkjocQdywZc/LeSMzvicCOZeXSeEmrJcaWk9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAUFK3g3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77689606A32C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IAUFK3g3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A9D1F000C6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 01:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794964523;
	bh=ei5zvsY36hyX76GY8L34lt7H4EbEz5X0q8+ZsGkzAPg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IAUFK3g3kUwyPLOyL0lZ8GhG7JirX/0ekKJQ8/N9G9dYZqITksKeDBbCkjHJ13bF6
	 NUdjd7jzPzxLr932KhvDOXbX38zCVHXTWwYXBkD1zF+CYTZg1q6TpmBYBJnB4GX2pH
	 syICDB7Tlg0O9SSgMHW7ndQqsKqh6l5mAOHs9vWWsLzALFEAiHx3JJYrK1QJoUMbZk
	 9L6nagUKhHIRE4HTBXWxmZ1pnG4/Mx2c+M/AngHXDw4yskDBfv8HJRNZvNNsPM42c7
	 3rEvNY50eu6donOmgb3ZQYUSS+olW062/c7LSPFz4tbCf0yWBEHlM6mPy64c7RIh6b
	 5W1oiA/Qlr2Qg==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so38786666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:15:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFMUNxjJMpLj+cbEJ171EvoQvsvfgIQSx+/qTvlmurccZIHKzQietdYipI1YnwbY2g5uPlCiEbDJ3rl9No=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qgStAF5cAyJfCNUcKQtagtEviH3ihzFFASXUtQrCohQ0YxhUY
	bSV1twMyRmzxLkXpf9567TGuUu/CnrebLiGK//aL7lGD9ppv6aOWsDrCHKvoH2jUo/oIJOoG6sb
	GgUL6+MlPyTlziAQeVG58CYyNVvR64cQ=
X-Received: by 2002:a17:906:9f85:b0:c51:94f:f155 with SMTP id
 a640c23a62f3a-c510e1ee11dmr72201266b.19.1794964521719; Tue, 17 Nov 2026
 17:15:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118002159.20576-1-ozgunkultekin@gmail.com>
In-Reply-To: <20261118002159.20576-1-ozgunkultekin@gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Wed, 18 Nov 2026 10:15:09 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8z=5Q5Po5W5HBwDVGfn9DQsaQuom1x5=ssP=2BfJ6Ebw@mail.gmail.com>
X-Gm-Features: AclHuK8N9K2bm-bGjGUVXTHQ06NTTFDxT6OkqVw5N5CTHIJ3Zt4tepcXuwV3MaY
Message-ID: <CAKYAXd8z=5Q5Po5W5HBwDVGfn9DQsaQuom1x5=ssP=2BfJ6Ebw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: do not let the server grow a write subrequest
To: ozgun kultekin <ozgunkultekin@gmail.com>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Tom Talpey <tom@talpey.com>, Bharath SM <bharathsm@microsoft.com>, 
	David Howells <dhowells@redhat.com>, netfs@lists.linux.dev, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 9:22=E2=80=AFAM ozgun kultekin <ozgunkultekin@gmail=
.com> wrote:
>
> smb2_writev_callback() takes the byte count from the SMB2 WRITE
> response, masks it with 0xFFFF if it is larger than the request (for
> old OS/2 servers), and then copies it into wdata->subreq.len.  A server
> can return a count that is still larger than the request after the
> mask, for example 0x8002 for a 5-byte write or 0xFFFF for a 4 KiB
> write, and the subrequest then covers data that was never sent.
>
> netfs uses the subrequest length to decide how far the write collector
> may advance.  With a grown subrequest the collector moves collected_to
> past the data that was issued: netfs_writeback_unlock_folios() walks
> folio_queue slots that were never filled, and
> rolling_buffer_delete_spent() frees folio_queue segments that later
> in-flight subrequests still use.  This is a use-after-free that a
> malicious or broken server triggers from an ordinary write:
>
>   BUG: KASAN: slab-use-after-free in netfs_limit_iter+0xed4/0x1040
>   Read of size 1 at addr ff11000010561511 by task kworker/u8:4/63
>   Workqueue: events_unbound netfs_write_collection_worker
>    netfs_limit_iter+0xed4/0x1040
>    netfs_retry_writes+0x1410/0x1e90
>    netfs_write_collection+0x2647/0x3880
>    netfs_write_collection_worker+0x1cd/0x3e0
>   Allocated by task 141:
>    netfs_folioq_alloc+0x39a/0x470
>    rolling_buffer_init+0x29/0xc0
>    netfs_create_write_req+0x12f/0x840
>   Freed by task 42:
>    rolling_buffer_delete_spent+0xb1/0x220
>    netfs_write_collection+0x1f62/0x3880
>
> Never change the subrequest length from the response.  If the count is
> still larger than the request after the mask, fail the write with -EIO
> and record it with a new write_overlarge trace point, like the read
> path does with read_overlarge.  A short count still returns -ENOSPC as
> before.
>
> The folio_queue form of the use-after-free exists since
> commit cd0277ed0c18 ("netfs: Use new folio_queue data type and
> iterator instead of xarray iter").
>
> Fixes: 3ee1a1fc3981 ("cifs: Cut over to using netfslib")
> Cc: stable@vger.kernel.org
> Signed-off-by: ozgun kultekin <ozgunkultekin@gmail.com>
Looks good.
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks!
