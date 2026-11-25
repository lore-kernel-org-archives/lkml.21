Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581546;
	b=TXLRNyz1QetQ0NRWx39ZiAKgMV/zOAHLdImVt7gwSlSQVoXV0ZAePVk/N711tYJplqi/
	 XztJM/gXy7End/1J+PedlmGoUBT0mySSNJhyjJfkJpMzT4NKUsSM3/JgcdF8NutMRmUkc
	 /HA+J/IQSOeuB62NOgeTu4z8pIfgHq52Ql8Ut+Tkw7JC+qL5uo1N/JokymHoldYz4nXum
	 fVi+nJmMIHugF5NDnmPqXgGA/ukV+sgRpHcu8ao5KYJrdk/Qg2P1cVvKhfdAkGXzhYZGn
	 uDKtMiXNgcdictgMCJKwrbEDh5S+qjaXcFco4xJ6sMI8FxBeXFsqhSeJE3Z7QYkuQQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M1IwBh5fU8djxahihZYht6eqba9dhDsjvhjt56+O/p4=;
	b=Ls91be+Pbofcfs40ifE8fphKkHBJ9vYh75brB1YauMIAsBrYwKgOW6ANumlkHXAOFpEg
	 RXh8qCH/7uVZELAz2NcQe/fNX9AlGgcGGZ4BF5rasaLf59yNS7Afdu5RZYvEqZloj0D/M
	 JAy9z7CifpKZHyUwmsef7O7SG4D2v1BJtkq98hJO2tYLcMhJ0xXwazoIDe/+34ueI5169
	 /XxMl9zNHcV5UPHZjUrrDAFctdnQQTJpZ8RNtmTtoCZoUBdVBwyNFAc7BnvSwUMmRRsIC
	 dbccL3nQiq54WeJW0Q51lwuVtJmea+IdmGtlugZ6+1bwY3pMe8yfBkmGTtBYD0QSZfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=hfx3jbvv;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44147606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44147606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=hfx3jbvv
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a9f9473029so4007721b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795581539; x=1796186339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1IwBh5fU8djxahihZYht6eqba9dhDsjvhjt56+O/p4=;
        b=hfx3jbvvc4rSYQAIe5Rb9SK6R0KHMzfl/hf8WB3MQRrF33IztnXGYNVhuqXJmJAfnJ
         k/xfschRWyB0NGuiAIXxCKvnsKB/xV75ulAkhF5H17+DCnsf2fQJa9UmrWLcjcXak4Q7
         LTCdiXvGqDWxHbXZili8R2i5rjGn4CVmubxkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581539; x=1796186339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M1IwBh5fU8djxahihZYht6eqba9dhDsjvhjt56+O/p4=;
        b=AQtO0JQq6RivSqFnOYE0FS54Hy7lb4L/xAlYkylUOlpjgcddY5ScJljzCm0LM0UDCe
         TlcZJXOTv+AxHVGk0gM3BlGsgJ8pfNDDgqM/R3KEigOWkhvtJmDDc1qQR3f/sPiG62Lb
         YzW3hn4Y4q4X9xVDPGjzJdUcdfSZ8Rzb9DgMDa6hda/Sb0lhafX/G1rGfNoKeuphNd6g
         d/z+b7wDGWMBq2Xqb/ORBCptbfEHgGqPS7I5ZTxrIH/tN8e2c6eSiH7T3GXyqmKuBzRN
         Nz9xNPgDQZ1pdUUsjaTQIQe76UhjpDGgDQsKDfVB53GCtQrxOFAflcZvHKuMfZZ7SOAw
         o8Wg==
X-Forwarded-Encrypted: i=1; AL+hErFz9nMvSkTGnI6XobN4ONz6xv2zs6LfSTUwpwsnGy93jffyQHfMbLA6CRLpZrGsAUAp7y9kuX4iqrPz+uA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rFNJPTgudWv1ZOEeKX5OseF5MPWkQqZ1GlHnX6D28rSMGqOMb
	X9RMN9n4UMPbNdNg3nN9ZepgtzE3QRyysvOxtTaCa91IwZ3CmvTM/JKi1DFClPFp63pO3q1v6/8
	427E/di1ztA==
X-Gm-Gg: AZFdTZcWGJyWuqENLEM7zLXJjW9llX18NqIvVPvK44dy9IzUzcquJaLI8nS3BqR7C4k
	hi+yfzzO7stGb7HQtN5YqKYXkF5Rw2MgJXiNaGAXeUXuNkikMrY15QJw/YwHyUiRFPnFWt97tU7
	akI+kpjKsqf432bNIv69McG8fAqad9tQlS/rxk7zaQv0tvSAUX2kFRW5FJKDyPBVS6pTLgk6mKf
	Uph5LGFPE1GDI82Ka5/e4zTQn00Vue9rPCoSF2WS1bMUnBZ4F6SNniZz6UMrnwZ84tZ6PS4dwBO
	IR0A6lDtOvN7oxP3ONeML/ZEU8/mBYkrbO8odTu77G33cfcdCghTu/MwNJ51upPdl1EN6dPED64
	HseJhQE26kuFHKA0g4Gmxhqp+1Uiq/ZJCTj7WYuz+DGJyUsy1Ikodx1EPB3mdagpj6Z1dOFrILQ
	TGySfjnNsE1cr0xbEFFWJnOZUccA5KE0W+uesvj2A2d669E7TTc8m1NjyDL+M1slRecSoJmg3x0
	fYw5HxgkksgHP00Pgj5C99rx/m1ZebAjPSwBOOjGrEm/dFt/Ngg+QXiH4XoeNrHpOszqgLsxEQH
	/d/sSWiqkfOx/yQgvn8Y7hVcZPg1UnK+iysjhE0iZmkSY3ZJ1C4HZkC3HgiGAtp3vytDFdRb19E
	sZshC/8uXpz0uNZ+4ahqK4TumAyDEEjxD9YDYqCi5qfegHwvE4gQzRsvE9cXXHc7qQw==
X-Received: by 2002:a05:6a00:14c3:b0:89e:779b:d0f with SMTP id d2e1a72fcca58-8c87ce3165emr16054013b3a.37.1795581538541;
        Tue, 24 Nov 2026 20:38:58 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e485f5sm8318535b3a.22.2026.11.24.20.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:38:58 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 2/2] wifi: mac80211: widen the mesh IE offsets a u8 cannot hold
Date: Wed, 25 Nov 2026 10:08:53 +0530
Message-Id: <20261125043853.885152-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179557011887.3135.15766992632445342222@kernel.org>
References: <179557011887.3135.15766992632445342222@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both findings are right, and the Critical one is right about the worst
possible thing: this patch was not the no-op its commit message claimed, it
removed a truncation that had been accidentally containing a copy, and it
said "Neither is a memory-safety problem" while doing it.  Thank you.

Checked against wireless.git at af6737b90668.  v2 is posted as a separate
thread:

  [PATCH wireless v2] wifi: mac80211: store the mesh IE blob's length
                      without truncating it

It applies on top of the v2 of the other patch of this series, which is
answered in its own thread.  The v2 changelog is under the --- line with a
Link: back to this posting.

Point by point.


1. [Critical] The false premise, and what the widening cost

> Is that accurate? struct ieee80211_if_mesh in net/mac80211/ieee80211_i.h
> still declares:
>     const u8 *ie;
>     u8 ie_len;

It is not accurate.  ieee80211_i.h:829 is "u8 ie_len;", struct mesh_setup's
is a size_t, and copy_mesh_setup() at cfg.c:3449 assigns one to the other.
My commit message's "ifmsh->ie_len is a size_t" was simply false, and every
conclusion I drew from it is worthless.

> ifmsh->ie_len is never above 255, so the vendor IE case in the commit
> message (vendor IEs starting past byte 255) can't reach
> mesh_add_vendor_ies() as described. The truncation still happens, just
> earlier, at the struct field.

Right again, and that is the part I find most instructive: the patch widened
the locals that read a field which had already thrown the information away,
so it could not fix what it set out to fix even in principle.

> More importantly, can the wider len now overflow the beacon_data
> allocation in ieee80211_mesh_build_beacon()?
> Take a 257-byte RSN IE (length byte 255) followed by a 3-byte element.
> That gives nla_len = 260, ifmsh->ie_len = 4 and prefix = 257. The RSN IE
> is found, and with unsigned int len all 257 bytes are emitted. Before this
> patch, the u8 len wrapped this to 1 (and 256 to 0).

Yes.  Walked through it:

  validate_ie_attr()  frames the chain against the full nla_len, so a
                      257-byte element followed by a 3-byte one is accepted.
  copy_mesh_setup()   kmemdups 260 bytes and stores 4 as the length.
  split_vendor()      "pos += 2 + ies[pos + 1]" from 0 with ielen 4 returns
                      257, since it tests pos < ielen before stepping.
  find_ie(.., 257)    returns the RSN element at offset 0.
  u8 len              used to make that 257 & 0xff = 1.  unsigned int does
                      not.
  build_beacon()      budgeted ifmsh->ie_len = 4; bcn->tail_len = skb->len
                      and the memcpy writes the rest past the kzalloc.

So the widening is what makes it reachable, and the scratch skb's rounded-up
tailroom is what lets it past the skb_tailroom() checks, exactly as you say.
One distinction worth recording, since it is not symmetric: in the peering
frames mesh_plink_frame_tx() builds, the skb IS the frame and is sized from
the same u8 field, so there the same over-long emit is refused by the
tailroom check and the frame is dropped.  A failure, not a corruption.

> Would it be better to make struct ieee80211_if_mesh::ie_len a size_t to
> match mesh_setup and the nl80211 policy? Rejecting setup->ie_len > 255 in
> copy_mesh_setup(), or clamping prefix to ifmsh->ie_len in
> mesh_add_rsn_ie(), would also work.

v2 takes the first, and the subject now says so: "store the mesh IE blob's
length without truncating it".  The reason to prefer it over the other two is
that it is the only one that makes the stored length describe the blob again.
After it, the length is the one validate_ie_attr() framed, so the split
cannot overshoot; the beacon budget and the peering-frame budget are both the
size of what the builders may emit; and the two consequences you found below
go away with it rather than being contained.

Rejecting setup->ie_len > 255 would be an ABI change - a configuration the
kernel accepts today would start failing - for a field that has no reason to
be a u8.  And clamping alone would leave the other two problems in place.

> If the blob length is a multiple of 256, ie_len becomes 0. Both builders
> then return early and a secure mesh drops its RSN IE.

Confirmed, and v2's commit message states it: the kernel accepts the
configuration and then silently emits no RSN element, which for a secure mesh
is a functional failure with no diagnostic. 2304/256 = 9 such lengths are
reachable under the policy.

> Widening offset is also not a complete no-op. When the vendor split
> overshoots the truncated ie_len, the old u8 offset wrapped and a few bytes
> got copied. Now nothing is copied.

Also confirmed, and also now stated rather than left out.

> The preceding patch ... argues that the split returns an element boundary
> not past ifmsh->ie_len. That rests on the same assumption, so similar
> layouts with smaller RSN IEs look like they already overflow there.

They do, and that patch's own review found the same thing independently.  Its
v2 clamps the bound to ifmsh->ie_len, which makes it safe on its own whatever
the field's type is; with this patch applied as well the clamp becomes belt
and braces rather than load-bearing.  The two are answered separately because
they drew separate reviews, but they are the same mistake twice: a sentence
in a commit message asserting a bound that the code does not have.


2. [Low] The Fixes: tag

> Should the tag be:
>   Fixes: 082ebb0c258d ("mac80211: fix mesh beacon format")
> instead? There is no runtime impact, but the tag decides which stable
> trees pick this up.

It should, and v2 carries that.  Confirmed by reading the commit: 082ebb0c258d
is where "u8 offset, len" in mesh_add_vendor_ies() and "u8 len = 0" in
mesh_add_rsn_ie() were introduced, in 2011.  2b5e19677592 moved the
beacon-side calls into ieee80211_mesh_build_beacon() and left both helpers
as they were, so it is the right tag for the double-copy patch and the wrong
one for this.  Your point about the peering frames holds too: the truncation
reaches mesh_plink_frame_tx(), which predates the beacon caching entirely.


Thanks again.  Two reviews on two patches found the same false sentence from
two directions, which is a fair verdict on how that series was written.

pw-bot: cr
