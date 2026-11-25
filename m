Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795581502;
	b=B6WI+R8c/B/DR6niuKB0sVaOkI8zwDLqf/NkwV+S4Je7DwXo4LJmYQzHcniouHR8Bd3t
	 wz18LeAc8/24HBWDRICFBwANtUwzNgdCplBMQX7DMXAaG8mlIqR+CyLaqYOLsvPV2ECy3
	 gfcxbvmHU9h+eLVBGoxLfqmL68dP5OHi7BLgYMhu3gtVD0/Bf+N5P61B9DKbum0UYOq/2
	 9F8FA8kQJsBDPIkKzdmKxPbdWr97mvPW/w+WLvliXhe1NbXEkBOxVL4Tyyt7DlT1+3q3I
	 VRS3SH2EL0xTF1k3SLgqmiL2Y29xxdhgxtls7u5svXdjIYKE7OEDBecU/HCs/Fb4eVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795581502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/XzU858PVVYWx9ArqiKeFW35VjWV+s75oIaXtUyhULY=;
	b=fH2XyqVHh75T9BJCQB5lI0RksgQzXnLo8Ys+PTjAniUAYN3D+Xc5qsRKuqXQQDUD2qfX
	 Jxm5TY76NixABvm99GMvB/t1Zqi416Uh8mLg6Tcbk9tjJz7YGMZTenEIJ4gKLVd+FG3I4
	 nZrhreA+PvvGaKtio4N7KHGe52bmOWzqw7fpAnL4/NwmD4kUY8KiPEGMdhFY3CFOzuQQh
	 hDlDWhL3tWSJUePbkkAsTpNZnJP8aRf8HNgTYDtL/p7zCikwARpeGKqvkJCYDD6CPh0JH
	 0gAaUyuoC+pY2tsgS10LqoOilDpQlSDlnovTxr3NZ5/8ztLy2fCsdjChoOSxDfObGqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=iyObN45M;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A73F606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A73F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=iyObN45M
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f02f04a426so42999985ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795581496; x=1796186296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XzU858PVVYWx9ArqiKeFW35VjWV+s75oIaXtUyhULY=;
        b=iyObN45MJgSxqtlageqtgYM5837oiaIJ5+bs0qPevJBMaCNHqUnWeShu0jRy5dmA0j
         5mGfFnENTfbpmsauuhF6jVGaSZjj0lqeDdiPTX1woD3jiAf5uRd09IFuo1ACxoziIZns
         haiRHfYJ2i3O2KrAaRW6U9bsR5Y2HPCJHyUCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795581496; x=1796186296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/XzU858PVVYWx9ArqiKeFW35VjWV+s75oIaXtUyhULY=;
        b=Bs7BjindG/+PqBray+rRDml5wvz39G6eZ+ueyPYqQ2/6k8uKdyMcXqE8U1fr5qV431
         A/NopVbv7Ctw7KXFawfOKCFGU6G2Iag/hz2H2kRAXDe02iqicZivV6Q1dEtFcw8eXTeZ
         kqgH9oid+OyUvjLpCZbIZWB10jQLEinljhVE7SmH2+kqiksxjvOrkZJJ8RSnfwcot/ec
         eohewgIQYx4IEPp2c+qx4u0Giom37UtQQpzqCT2UAo6ZupmbPP7PvY9seM9KLzcTo6hk
         ZttS2PMe+PL9jrcP12fMsD9HMfdq5QIR4AA63TxS+eybclWcAv5wDDozPuwrVaiOTxjd
         sRyg==
X-Forwarded-Encrypted: i=1; AL+hErHUdsM5w5YeMAgUStHPfBtsMO6KjTxYghc6gaN0T9xuEa94JSxoOu+ZZ3yGhLH76Rvp9ZSVMxMU04AHhxQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ahtMau2kf5GcowIUCu0odB9NK/vGyOXi9rlLczDxeFsUkjHM6
	rlbWsfVHPQlmhEyJ1d8c4HUXCxo+vvKteaBWHfyuIX39/vivkuIXEUMCQMLWvThvyhU=
X-Gm-Gg: AZFdTZclBhQwxChfg15gFiokswF/CiMTn2p5SiKgltf5kQTWRxhJJLrhjOf7jOXOfMY
	E0yAulaG7Tx5yZY9DFEh5POoImIoK4IoqiHiQrkYXoYdUyxAikFJ+3SDiostFLBMBfhI+DRRYh+
	al7+cR9TZFvkkgKg1eSpQjjjUYxxz4MMRwSZbuG9H8jisbnRcLcw+vF95PHC6iuzp3W2AlkE5Zh
	BVn1X3q0KHEUhk43CMeo/OXi2fCfrgk7nqpGKFnQTo8JwrLW5VINu3RHgcDwGeZBheBURWwS0Y7
	OAGlonWY9cXvuLNczTHDWfNJDpLsPXATAbzn9sSI0eu7CuONhKZFw2QBb//EHVI6y+9PmexlCRe
	uQyy5VHpF+lIYrVwrOCEbgM8EGJz8XgaU+FWMgV1DtZz3rx28zmC6PBTRrghDzcFCAI9qeq0wHY
	NsS+WOGyAu9O/NyeDVu2gB/rVt/MffCOwJafWiT96Q24cFtaZXFUa7VtWB65IdsQVyhVyiU7vr+
	urWoRvEWe5OHr5jaashbrgtB36Pd0rwYjQaYADFThQw3X4uNusv2NYd6Yfq9bkzjYCV5yoi3Bq9
	DJ+DF98apCDBENBbF7yxXdlC1e5TDXUebHrEm/Cq1Jv83SulM0zR+hxLcBfg8slL5Adp/9pD2SM
	I84Uoyp4e/Y8w58lON7GpEES5v9yi2JHCLeSH0r8NT+qr3zh2N9va+LB9HSwyvt69
X-Received: by 2002:a17:90a:d2c7:b0:3b4:a90:7f3a with SMTP id 98e67ed59e1d1-3b41c95da5bmr15165176a91.55.1795581496295;
        Tue, 24 Nov 2026 20:38:16 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b703530sm10736254a91.1.2026.11.24.20.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:38:15 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: mac80211: do not copy the mesh RSN IE twice into the beacon
Date: Wed, 25 Nov 2026 10:08:11 +0530
Message-Id: <20261125043811.884090-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <179557011763.3135.4931211502666684623@kernel.org>
References: <179557011763.3135.4931211502666684623@kernel.org>
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

You are right, and the Critical one is right in the way that matters most:
the patch added a second route to the overrun it was fixing, reachable
without any vendor element at all.  Thank you for catching it before it went
anywhere.

All three points were checked against wireless.git at af6737b90668.  v2 of
this patch is posted as a separate thread:

  [PATCH wireless v2] wifi: mac80211: do not copy the mesh RSN IE twice
                      into the beacon

Only this patch is respun; 2/2 drew its own review and is answered in its own
thread.  The v2 changelog is under the --- line, with a Link: back to this
posting.

Point by point.


1. [Critical] Can prefix end up larger than ifmsh->ie_len?

> So it returns pos > ielen whenever ielen ends in the middle of an element.
> That can happen because ifmsh->ie_len is still a u8 in struct
> ieee80211_if_mesh, while the policy allows NL80211_MESH_SETUP_IE up to
> IEEE80211_MAX_DATA_LEN (2304) bytes

Yes, and every step of that holds.  Checked in order:

  ieee80211_ie_split_vendor()   net/mac80211/util.c - advances
                                pos += 2 + ies[pos + 1] while pos < ielen,
                                so a length that ends inside an element
                                makes it return past that length.
  struct ieee80211_if_mesh      ieee80211_i.h:829 - "u8 ie_len;".
  struct mesh_setup             cfg80211.h - "size_t ie_len;".
  copy_mesh_setup()             cfg.c:3449 - "ifmsh->ie_len = setup->ie_len;",
                                size_t into u8.
  the policy                    nl80211.c:10888 - NL80211_MESH_SETUP_IE is
                                NLA_POLICY_VALIDATE_FN(...,
                                IEEE80211_MAX_DATA_LEN).

and the write lands exactly where you say it does:

	bcn->tail_len = skb->len;                      /* mesh.c:1109 */
	memcpy(bcn->tail, skb->data, bcn->tail_len);   /* mesh.c:1110 */

bcn is kzalloc()ed to the PRECOMPUTED tail_len while bcn->tail_len is taken
from what was actually assembled, so anything the emitters put in the builder
skb beyond the budget is copied past the end of that block.  Your 257-byte
example is right: a 255-byte RSN element leaves ifmsh->ie_len at 1, the
unclamped split returns 255, and 255 bytes go into a one-byte budget.  My
commit message asserted "the split returns an element boundary that is not
past ifmsh->ie_len", and that assertion is false.

> Would prefix = min(prefix, ifmsh->ie_len) fix this?

It does, and v2 is exactly that:

	prefix = ieee80211_ie_split_vendor(ifmsh->ie, ifmsh->ie_len, 0);
	prefix = min_t(size_t, prefix, ifmsh->ie_len);
	data = cfg80211_find_ie(WLAN_EID_RSN, ifmsh->ie, prefix);

Two things make it sufficient on its own, and the commit message now says
both rather than leaving them to be rediscovered:

  - the clamped bound is never wider than ifmsh->ie_len, which is the bound
    this search had BEFORE the patch narrowed it.  So whatever ifmsh->ie_len
    happens to be - truncated or not - the patch cannot make this copy
    bigger than the unpatched code's could be.
  - cfg80211_find_ie() returns only an element that lies wholly inside its
    bound: for_each_element() requires sizeof(*elem) + elem->datalen to fit
    in the length given.  So len = 2 + data[1] cannot reach past the bound
    either, and the skb_put_data() fits the budget.

> It would also need either ifmsh->ie_len changed to a size_t, or
> NL80211_MESH_SETUP_IE capped in the policy at what mac80211 can store.

Agreed that the truncating assignment is a bug in its own right - a
configuration is silently stored with a length that does not describe the
blob - but v2 does not need it fixed to be safe, for the first reason above.
I have left it out deliberately rather than widen a struct field inside a
patch whose subject is the double copy.

> The follow-up commit "wifi: mac80211: widen the mesh IE offsets a u8 cannot
> hold" doesn't appear to fix this. Its commit message says "ifmsh->ie_len is
> a size_t", but the field is still a u8 at the end of the series

Also right, and worse than a wrong sentence: that patch widens the LOCAL
variables in mesh_add_vendor_ies() and mesh_add_rsn_ie() and does not touch
the field, so the message describes something the series does not do.  It has
its own review and I am answering it there; whichever of the two remedies you
prefer - the field to size_t, or the policy capped - belongs in that patch
rather than this one.


2. [Low] The wrong netlink attribute

> Is this the right attribute? nl80211_join_mesh() doesn't seem to read
> NL80211_ATTR_IE.

It is not, and it does not - nl80211_join_mesh() has no reference to
NL80211_ATTR_IE at all.  The blob is NL80211_MESH_SETUP_IE, nested inside
NL80211_ATTR_MESH_SETUP, stored by nl80211_parse_mesh_setup() at
nl80211.c:11071 and kmemdup()ed by copy_mesh_setup().  v2 says that, and as
you note it is not pedantry: it is that attribute's policy that admits
IEEE80211_MAX_DATA_LEN, which is the half of the Critical issue the u8 then
truncates.  The reproducer in the report thread sends the right attribute;
only the prose was wrong.


3. [Low] The peering frames

> mesh_plink_frame_tx() in net/mac80211/mesh_plink.c also calls
> mesh_add_rsn_ie(), so this patch changes Mesh Peering Open/Confirm frames
> as well as beacons. Should the commit message say so?

It should, and v2 does.  mesh_plink_frame_tx() calls mesh_add_rsn_ie() at
mesh_plink.c:287, right after the extended supported rates, and
mesh_add_vendor_ies() at :349, at the end of the frame - so for a
configuration with an RSN element behind a vendor element, that element used
to appear twice in peering frames too, and now appears once, in the trailing
vendor block.

> and explain why it is fine to move the RSN element out of the standard
> element order?

The argument v2 makes is the narrow one.  Element order in a management frame
is not something a receiver may rely on: 802.11 parsers walk elements by id,
and mac80211's own do.  The alternative is to keep the in-order copy and
accept the duplicate, which is the bug.  And the only configurations affected
are those that put an RSN element behind a vendor element - the ordering in
these frames was built around the RSN element coming first, and such a
configuration is untouched.

If you would rather the element kept its position and the DUPLICATE were
suppressed instead - have mesh_add_vendor_ies() skip an RSN element it finds
in the vendor range - say so and I will respin that way.  It is a bigger
change than this one and it makes the vendor range no longer verbatim, which
is why I did not reach for it first.


Thanks again.  The Critical one was a real defect in my patch and it is the
kind that the commit message's own confident sentence was hiding.

pw-bot: cr
