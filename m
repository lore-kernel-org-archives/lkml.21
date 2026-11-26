Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686830;
	b=ul+imOJAi9fkpuLdFWKiY6KozvVco1ZWBFDDCvUhbGQzWX3FffvtTVqQE3vpt9pHTaOU
	 Dq2SbDQKHFr+BR0ZCNeuPrwUkUasfBaYSxIw5ifuPIqQVs5qIHzbTnxH/MhPSBwMB3Oln
	 cd38GV9LQpcIY/lKnnlBQKJ4GUN8FSWD6KqimlggOnjglNDnwAJHNUa3JLZ7M92ESe5i1
	 qualdk7z5oTsYHlTSi3VmkiHFuAcaEtLNCyX0UiD5KM4Luq6qxe64KcHFa6RjP2K6kBQ3
	 yK2nOI7v3B5BjYM2gZb7IxhzMSbko+ifArMZ2iaFVL0yp/BYpymSib0TeQK3NSzIo0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=IQ+jDuVBv1HbX1b3BBSVrbjflr2E8zhivXziNzPhcDM=;
	b=iqTizVjlb5ZCnQ0lgT8rhXWA40HTRg22LIbTkPZwUhBFfGFM/XchjO8Rmmwd/t/DwMkw
	 mG6yiTshQhL3lh+1O3zZKEZyIa2Orya8eTctN21WwcTzouWbqgQ+WloAukOuYtmHjNsWJ
	 2mbUXIp1JPJ4BDoz8k6ha7cdgEeoODLk5j0w1IMex4DjQXS5N0DRwjZ/2rL0lcSO4C4AH
	 fD6Yl4BYzIVw3AnQr7Ti0pG4MkFgJ56oGJGSAkfCCK+2Hb+91AsgJHCRmOOCKER0lhjKS
	 qitC5zEsuzwhywoaTP0Qka0Qtd1ETHFxSSKGL6owzsDA96aiGMpMj557BmBw4478z5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ATY9mf21;
	arc=none smtp.remote-ip=209.85.221.69
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45147606A339
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45147606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ATY9mf21
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0fc747a7so4600639f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795686828; x=1796291628; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQ+jDuVBv1HbX1b3BBSVrbjflr2E8zhivXziNzPhcDM=;
        b=ATY9mf21DZwNhmZpYSdtB3X8MG95289N7UHEfn2MzH1YO6Mw0I4FY6KBInec/MSWAN
         toGl5bwYMk/xVPG2Fux1x8h3CmZipQrOoR5NC+nzOzKoGZLuD7o3dks5fzithnN+E0XO
         cnzY9EjfZK6mIhrOPKyjMSv0bUe+5MGngOtq5Yz8qamTYn4zPVoZRAb0oKt5bV2Ns8AW
         hXT3WXnkMk+37oKwYnS/zZCmNbF/xObSbqfIq3U6aiSkz+gYPq2z/GxzJFsQHm3UCmbU
         yHjJkTjenXIPE0HPFI1mfEY8hSd2uSi84cVfMzqwvMFaPsDuYZMKmtozf0l0/KcvO8Ik
         mTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686828; x=1796291628;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQ+jDuVBv1HbX1b3BBSVrbjflr2E8zhivXziNzPhcDM=;
        b=zBv9FWROkPVacSZ4HuTJFB34tUgERdlxqSx5DnBfgJC/3EsKuBUnVgeqkSX90wgKEM
         DoBZuXwMYPxtiLJKXJ+VjMtoE6cti1+R3//vieO6O5KF34gS3IpjntTxQHQZZr7gtFIN
         4OF/+5VWKD/x4pFtqlbx7ubKLpSTpKYhYcU0twZzgTNVoGePWJNgVnYhyFjI8n+grjrO
         6RqyJYe7SO30EI2Tfa+OglHh5Tbib9wIUJsgR++YO4yRfIILo4jLfnxAEgswQ3++4Om/
         1h6l27B51x4EVyql/HT26wypN3Rdh1ZaZAa9VN7gKCQGX5Dejjm3/8sNcOCPp54Rn1ym
         LD3w==
X-Forwarded-Encrypted: i=1; AL+hErHEGYARJnK3xXnwLXWw8dIlbt7iI0uTMva9doQv1pxvFpXQbrpvS63ZrMFKNMG0GMO1j+U5s32BhJFLTZE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IUSHCAUeZOHCJY+mE+keCEk4SP20eeGoV27gZiLEOX+tsF9/Z
	nUp0FLT8URnDbUJdwpN+RANFW2XyduZ9gYN7VPeKt7YZNm948nL3asI0761bq5iCqk/FJF620yv
	gq3eCXnnz3F3SD7a6ug==
X-Received: from wroa3.prod.google.com ([2002:adf:ed03:0:b0:4a2:f12f:819c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:59c3:0:b0:4b5:b60:4814 with SMTP id ffacd0b85a97d-4b50b60487bmr22618872f8f.54.1795686827511;
 Thu, 26 Nov 2026 01:53:47 -0800 (PST)
Date: Thu, 26 Nov 2026 09:53:39 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKQBCGsC/x3LSwqAMAwA0auUrA3Y9IN4FXFRNWo2VVoRQXp3i
 8vHMC9kTsIZevVC4luyHLFCNwrmPcSNUZZqoJa81uRwkrhwQkOTXLjKwxk7Zx3bYFrvA9TxTPy H+g1jKR+LB8dHZAAAAA==
X-Change-Id: 20261125-binder-32bit-fixes-8545e4a3066a
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=936; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=EpMduAqe51nfTvXf0d6Ojk5wyRUruSt4ngGPShsiPWM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBrCAGpCYmZgGXciGbCpezM5TFDplsUak60b3HpE
 Qz0XGyImN2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCawgBqQAKCRAEWL7uWMY5
 RqRFEAC4u5UqJMUvF1FCrevyejCifXyIvacrgWdtTDHksm8L8kB24b3GPQqZ2KiaWODShrglh6U
 sjqL0YoSRNLR4pbS3JcjavmENMfsG8katQCauZI0f+WjlRXQQh+dLFznvojSVxV9ughV/FP0wdS
 k8S6nOrqR+4hicnMWIFoEimMOyAjgrd830ZMZ5EgZE6O/iX6wsRRBmjAPKkTAKISlmnS0UII2SC
 tP0lELozuwgMJ9OJDQgKdLqoWMxUtWn8FJmfMN304p0eiklxDoEIWAuRzZe5qGGQn2eEyYA4eB7
 B3hqgAAL2Q53I7YTlhVTVCzTYV5rKrSq1l0iWBrYDZ38A5zEq6rNV2D4WLJe6QwMZEK4JyqFCjB
 san4mtxyPsvKWYB8Hg7+YkoKmmsHw1ZJKmx/CX7hvfWgJDBYrx0Qntsbx4PygX1NT/b+4WGTqZr
 bEUM2CpIP/tfDBhw5lng9wp5+RFOp3lOtceYXAv3ptUduNZZ8hxLXnbPBvf6JfHnsyV2/yjTkL/
 w8dJvJgyTSTRlqXLF45iyHcRi1EQ63goQNgT1y4lwIdnq2t+Hs2vJu8afAH08abcCkK6mHbFlvU
 FPMowGj64Pk79+iuo0O+w+nv1M9zAcvok9JEMw6WnjXhxDqFYIrg/2UOK7RTDz0fTZ9Zqndc3OP JON+2IYYSZzoVEg==
X-Mailer: b4 0.14.3
Message-ID: <20261126-binder-32bit-fixes-v1-0-22fc21baf6f8@google.com>
Subject: [PATCH 0/5] rust_binder: fix 32-bit truncation and alignment bugs
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

This series fixes several bugs that only affect 32-bit platforms.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (5):
      rust_binder: read u64 pointer in BC_FREE_BUFFER
      rust_binder: clamp write_read buffer sizes to usize::MAX
      rust_binder: reject transaction sizes exceeding usize::MAX
      rust_binder: align scatter-gather buffers to u64
      rust_binder: use u64 for node and handle reference counts

 drivers/android/binder/node.rs             | 22 +++++++++++-----------
 drivers/android/binder/process.rs          |  7 ++++---
 drivers/android/binder/rust_binder_main.rs |  5 +++++
 drivers/android/binder/thread.rs           | 26 +++++++++++++++-----------
 4 files changed, 35 insertions(+), 25 deletions(-)
---
base-commit: 917fcbf033154a6c8d83cfa6c88f012b71eb37b2
change-id: 20261125-binder-32bit-fixes-8545e4a3066a

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

