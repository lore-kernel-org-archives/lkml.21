Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468969;
	b=4ISUKDpt9Xn5JMAiLgf/3uOweN6SK44llXm3NG9G6fPHQWsXjMh0J3FbtClnaKhLHloO
	 6VmQX0ytpcp9ExayYVu2P+c4DGfCnxx0jqAu7p1tlCFnDHu/NE3qaR6tIQ9UAtVYgwLyp
	 L3gSiP7SPr563m03NdUWLcbQK/+Aw2O8loDIgytOcmgw6Whky18L41f65IOztVaZPms0I
	 ySKk9hVFQkiuQHrWYAigkzFO/RFBwA9JAGszR2yxxO4z10Vx/YNQZErKOO5+LUuIC4Cpc
	 iMJbvl/MJFwtH9Wu+l7WvZEQeM1vtsrPuRcvEE1l9tLoWoP7RxMvk72deJS5GUgnJLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468969;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eU+6TDE9yV82imn9cftyUyCCED7xbfUv9FoTzNU9AxQ=;
	b=Skg3ihbE3orv2oRPEbrQqR8mtwJtIoF8mvU008TmTgCw7yNEZ/BeZXXiJODzVdApijIs
	 v4Z/cNKuzwKNK9l6877Wqi5tx+9QNOvZeSjMPDhHeRgXO+KMtbMBg9POtHPXQkMZxkZGg
	 mMRLsAa19xl2uAO9SfuZpr0Orym+8D8BF4gWSn9rPLZ8vkmuP1Wwr2pKhR5QfuiaGnin6
	 428bCBLMz83QaXCF27yPWSIwwxEdxlsuPP9WfC5dRxWnJZ8Xxg7oz4ppaMoluYHL4kdpE
	 Z3fAhGgCY0Dy0O7Ppdxx5c8qvgsMrLtfZ+LFNzy3SyDF3qVKcQQ2480kNAZ+RFZgr3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXzdykSl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE63606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AXzdykSl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD211F000E6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 21:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795468969;
	bh=eU+6TDE9yV82imn9cftyUyCCED7xbfUv9FoTzNU9AxQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AXzdykSlrixB4Ol5/wwg5LVbxAPTVXT0ydB610Pgq4ImciJ5PIhsl/680uPtvZGc9
	 cejHShoviTPVdjoG3+p+4tkgDeIDWJvad/73fG1eXA063UDMPN2k/vBgrK5pkAzVXA
	 HRjdFT1Pb7N93/TJBYkm/LFKdtj+zURr1AqwI395pEC0+1IbHyo4hUqk1vlTfAUQf3
	 xUXCHaYFL8knlVLhmvHtlDuUExEblqY0e67oMfxj0CivH40qgApR90Vt3dM1PXt9GV
	 FA2IjnQd/1Yv9T8cVB9M197ijLgwhaPwXozGmxSnhrUFvRfcXYxj8WGhnQvYVWDMOl
	 NbD/TlN3JxK1Q==
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-949589c1495so344666985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:22:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHce+ziSqXSotk8Bfl6QO6E0d7+k5OV4wlQQiSKEzR52Id0ntTHXO3tTKlBmYBxXMQcYQh/Dw/ttKKCNZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ce2AMUhSGpzmvBqJrgfNLsIb+pH9ANT4t/EQuoupkbwBho069
	zbd5jXRN+fxA07vSBtPRyZDQNzRDOyanG+uvoRYBIjs+1zVO76pin6z4zvnwyXmU5xAuLcKllTG
	bzLrPS1Q2iVv8c5LZAmaw0v2H25wHesw=
X-Received: by 2002:a05:620a:29ce:b0:93e:d854:4b83 with SMTP id
 af79cd13be357-949ba9b3e16mr2296045385a.22.1795468968646; Mon, 23 Nov 2026
 13:22:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123135200.4086519-1-max.kellermann@ionos.com> <20261123135200.4086519-3-max.kellermann@ionos.com>
In-Reply-To: <20261123135200.4086519-3-max.kellermann@ionos.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 24 Nov 2026 05:22:37 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4y8Meart6rfQ1i1oAm4NoM6YpPx+s-jgdrqgf_VPrs10Q@mail.gmail.com>
X-Gm-Features: Aa3M54rk1a4eAkP-XOuFBhkZSsK_OaOxvXCeyMlLajAigxVYkkkbNjKxH6OqKJU
Message-ID: <CAGsJ_4y8Meart6rfQ1i1oAm4NoM6YpPx+s-jgdrqgf_VPrs10Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] mm/vmscan: move code to lru_gen_{add,del}_memcg()
To: Max Kellermann <max.kellermann@ionos.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:52=E2=80=AFPM Max Kellermann <max.kellermann@iono=
s.com> wrote:
>
> Preparation for the following patch that adds tail caching.
>
> For simplicity, hlist_nulls_del_init_rcu() is now always used, which
> is also valid during rotation, because the entry is immediately
> reinserted under `memcg_lru.lock`.
>
> Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---

It looks like you missed collecting the tags[1] again:

Reviewed-by: Barry Song <baohua@kernel.org>

In the future, you can use `b4 am` to collect the tags automatically.

[1] https://lore.kernel.org/linux-mm/CAGsJ_4wit5jKGn4L-NDTqzxDRNS8s8-FV3g0m=
5e6BOcG2Gx2Eg@mail.gmail.com/
