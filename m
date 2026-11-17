Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.30.211.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958345;
	b=OXrj695YZ9dXdbcGmyimh8b6PNBsqqmF/mw2AeYXd/Iaaq4MPaK0R5ZZVt/k8ExXF2pQ
	 biT1VN6RHOSZJuNBwFk091+sJAaaZiK2ziXSHX+MWZbRD6MoYrLNOPvvjMag3oJpe6FLR
	 pN9achJFVq5NGLzVANqyMePs7qZZ238gghv9Lm+C7qhYmb29a+VNiplvG8MMoxtJ/UQiR
	 CD6XPepbXPlP2wrhDoc+ijJGXELPVyq1LES2ljqxwxK2PQeostLbf7Y4dU22RQ9ooRdYD
	 XGkhiY844qkDikOIkqZnVGczRJKhw6fi3nfIxX8GgOREIwEylgs+m6xVwLxjJ0BDUcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958345;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:X-HalOne-ID:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CVK3gfdAVTQvEZy1bbvtoLOfN8qA9o6BEbEAHYrhFsI=;
	b=1TPsFSYjyyoWX87CWxSb5B7mgWfuVNpXPbJX8Vh/vAODPn+M3RjXhM3MabGduOysvTZz
	 CwuRqVnuje894F+w7DN2X2EVq/RyWgKJPadAkT65aA2N/naT+dn65L7VLlzP5JRSt/WoT
	 lWx6JXfMeD7h4fODrD9inY9j1UXrMZNwHXs7TmGfH5YR4t6XbmaJys3jfEd5aEuPOagLk
	 0Lp3CxQse3W6+By4aHcfX13iMKTUOBxIoptsuXCcWsHSc+zQvJfBNwxoOY2wB1g/OCoth
	 cDDWdtqd/OPgE2Qbnubb9Y+tf92D5UwBDUt0Rhn1PyFg5ZAtf65C6RkFUqkDsC8Ci6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=konsulko.se;
	spf=none smtp.mailfrom=konsulko.se;
	dkim=pass header.d=konsulko.se header.i=@konsulko.se header.a=rsa-sha256 header.s=rsa2 header.b=yzcQO23C;
	dkim=pass header.d=konsulko.se header.i=@konsulko.se header.a=ed25519-sha256 header.s=ed2 header.b=SUgGnHKf;
	arc=none smtp.remote-ip=46.30.211.244
Received: from mailrelay-egress5.pub.mailoutpod3-cph3.one.com (mailrelay-egress5.pub.mailoutpod3-cph3.one.com [46.30.211.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E21606A882
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E21606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=konsulko.se header.i=@konsulko.se header.a=rsa-sha256 header.s=rsa2 header.b=yzcQO23C;
	dkim=pass header.d=konsulko.se header.i=@konsulko.se header.a=ed25519-sha256 header.s=ed2 header.b=SUgGnHKf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1794958335; x=1795563135;
	d=konsulko.se; s=rsa2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=CVK3gfdAVTQvEZy1bbvtoLOfN8qA9o6BEbEAHYrhFsI=;
	b=yzcQO23ChU7yvmqYbuQ6D0jbqMP1WbG9IbcPWDjLRV/NYlrlZo6M1Z8vSaEXIQT5nNA7BIe73BFsL
	 Fr6LwtG1iOz90omYQHpJwDRzOVi3vfuykDyIifyZlvnfQnLjhO9zrIIJYhk1Ab3CfI/6qBbGG/58ss
	 iotGJscWEBjvNvn1F/Ez90Huj/uWdpPGyyHtrlgsVXY0IyvvxxzxtlVyZbS7Ne6PrX5vbUVjRp2bQI
	 vu1kiDJD8g41SnjPP2mC7tvKARH87wQ36opA1XIg22HPMs+FHQWHjH5BMAxJbqUPcfUnRHK8sWGOoR
	 QiTM9jzTIYn0DjEvKM0yUXLbHQW7r5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1794958335; x=1795563135;
	d=konsulko.se; s=ed2;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=CVK3gfdAVTQvEZy1bbvtoLOfN8qA9o6BEbEAHYrhFsI=;
	b=SUgGnHKfQwurNL4LuAU22YrgMLE6sgHZ1v7IabgIk2MwXJrMjFGAkE9VJ0CKfYKL8ndhjB0eWguWy
	 tpIFBsRCA==
X-HalOne-ID: 1e020ffd-e2df-11f1-928b-49de817b90c1
Received: from slottsdator.home (unknown [2a02:1406:27d:15:2438:a644:c11e:a5ef])
	by mailrelay6.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 1e020ffd-e2df-11f1-928b-49de817b90c1;
	Tue, 17 Nov 2026 23:32:14 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: Andreas Hindborg <a.hindborg@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	linux-block@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: [PATCH 0/3] rust: block: add rbrd, a RAM backed block driver
Date: Wed, 18 Nov 2026 00:32:08 +0100
Message-Id: <20261117233211.3137168-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.5
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

This series adds rbrd, a RAM backed block driver written in Rust that
works like brd, together with the Rust abstractions it needs:

1. bio segment iteration and request accessors for blk-mq drivers;
2. reference counting, raw pointer conversions and a bit spinlock in
   `page->private` for `Page`;
3. the driver itself, configured through configfs like rnull. Its pages
   are kept in a flat array of atomic page pointers, so finding, adding
   or removing a page takes no lock.

Unlike brd, rbrd never lets a read and a write copy the same page at
the same time: each copy holds the page's bit spinlock. brd allows
this race, so a read that overlaps a write can return a torn mix of
old and new data. In Rust the race would also be undefined behaviour.

This guarantee has a cost. rbrd is slower than brd, mostly for writes
(4k random O_DIRECT I/O, 8 vCPU guest, mean of 9 runs, kIOPS):

  test                  brd    rbrd   change
  read,  8 threads     2048    2012     -2%
  read,  1 thread       512     463    -10%
  write, 1 thread       583     470    -19%
  write, 4 threads     1693    1472    -13%
  write, 8 threads     2004    1563    -22%

We think this is a small price for page integrity: a RAM disk is still
far faster than any real device, and a block device should never
return data that was never written. The gap has not been profiled
yet, so not all of it is necessarily due to the lock. With a single
lock for the whole device instead of one per page, 8-thread reads were
20-28% slower than brd.

The series is based on rust-next (v7.4-rc3). Patches 2 and 3 were
written with the Claude Code AI coding assistant, which also did the
testing.

Igor B (2):
  rust: block: add bio segment iteration and request accessors
  rust: page: add reference counting, raw pointers and a private bit
    lock

Vitaly Wool (1):
  rust: block: add rbrd, a RAM backed block driver

 MAINTAINERS                      |   1 +
 drivers/block/Kconfig            |   1 +
 drivers/block/Makefile           |   1 +
 drivers/block/rbrd/Kconfig       |  17 ++
 drivers/block/rbrd/Makefile      |   2 +
 drivers/block/rbrd/configfs.rs   | 188 ++++++++++++++
 drivers/block/rbrd/rbrd.rs       | 420 +++++++++++++++++++++++++++++++
 rust/bindings/bindings_helper.h  |   1 +
 rust/helpers/bit_spinlock.c      |  13 +
 rust/helpers/blk.c               |  14 ++
 rust/helpers/helpers.c           |   1 +
 rust/helpers/page.c              |  10 +
 rust/kernel/block.rs             |   1 +
 rust/kernel/block/bio.rs         | 253 +++++++++++++++++++
 rust/kernel/block/mq.rs          |   5 +-
 rust/kernel/block/mq/gen_disk.rs |  25 ++
 rust/kernel/block/mq/request.rs  |  81 +++++-
 rust/kernel/page.rs              | 160 ++++++++++++
 18 files changed, 1192 insertions(+), 2 deletions(-)
 create mode 100644 drivers/block/rbrd/Kconfig
 create mode 100644 drivers/block/rbrd/Makefile
 create mode 100644 drivers/block/rbrd/configfs.rs
 create mode 100644 drivers/block/rbrd/rbrd.rs
 create mode 100644 rust/helpers/bit_spinlock.c
 create mode 100644 rust/kernel/block/bio.rs

-- 
2.39.5

