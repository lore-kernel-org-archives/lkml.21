Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097582;
	b=Nz88+k0ERAV09KqR8CKvhVpGwuQmVYiDhSEt7tK0RC0/kVq/UrXOkXKtiY/jjImhVEg4
	 Oyj2icNl1aUbcjbX5Xn5vMAvWt9FYG9XF2uCzr1TEK0XOoO4G1gXYt3srxamr2/aGJTmA
	 0zA1UHi/JNiOJR3qlnR+mARrjK2WGVlt9DMLQZ6aZNg1tNgITXSwWYkYxOX4vKcsGH96N
	 msLtQV2n5coas+46c4a2qvpWY3zrOiF5xFbu/ScqtM+jedo8KPbYo9VzBnk8X76i4d2ip
	 +URg25N9vR3X8ChkiOyYDXTpav7+WwuoDBKDSGpDXKGoEvhSGUw/0eshEAMI4GlUA8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=iPOg98WErXU6k7QxTjI8OWeHV+3pxtJAY0SLKw9CUN8=;
	b=pDl1tYPCmbPipa4hZndwKz9BB31SGTJjL6goiQ3EPWZDiVbN+wMozdI2QbpIJgTXU79H
	 7ltmxAit/jsg/q+OiAcs67cHZ2kOunPOlg+JJ7LcSuKUPgM4McB2ca7pwgCmO9jynDDOL
	 sfOy94QNPi+fh8vGqUfLuF7Ap3++R2IzHEIF/FP2jqpFY0SJucVXixxbKrh/gXdsPBDY+
	 izT2l183DaaQfIFCOjoyKwfEiGr/IU6Jrz+huajsoWiQNZs0/NzepFP0EcBLZ8aSGFs5e
	 95GSAoGYSVkBoT5pXaY6CWEir4vX2iHbem/GUP7d+iWGD+MexoVbgMfDCkmKGC+FGCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LlHQjjJf;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEDD60A261A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAEDD60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LlHQjjJf
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a370217dcfso1644174f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795097580; x=1795702380; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPOg98WErXU6k7QxTjI8OWeHV+3pxtJAY0SLKw9CUN8=;
        b=LlHQjjJfSWAFpz3qfXWQiRTpYRtVQLe8k5N9agBpMdsMHh7Kt7CoBZhKETckNNo7Ve
         VHkTBc5hrMdjBbxWS8RVlc7/M6e7SikpY7GgDgvxrUvGdNnpokc/VV+1bTR7/t5CHNxX
         NdQK1FZ8muRM7jmmynAVDN8OqjOjE4LKyOQE1nAc6eckrx4TOXft6FdkWZIh573mTYS5
         RgiUHeXR7YsJ3e7RZi0AiPjQXkuxJ22c32WPcJIYrCSlNSupcCrCAJvCKfDZ9u4CK1hn
         VmYKKhcFfmxRhY02irvTAe7l6OlBNmJmEf+CYYyriCIN3hjdQ9o0OkKGxWv3t4V3rTHU
         W4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097580; x=1795702380;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPOg98WErXU6k7QxTjI8OWeHV+3pxtJAY0SLKw9CUN8=;
        b=eF06wARFHJqxF857O1F6G5397Pv7ydQiEkmBd7E5cejkQ2WlbBL+sJyQv7CEcXmj5s
         wbp4QCAsxQo0YOPB/6S3Yhmn6fXvqY2ybybxEKis9fDTX9/OjGsvlGRey3415C4D/ImA
         yF6YwfOARrkkZ3jVQA3srf+sOnLrNrIzLWyiqlgueK8e+L3+X8U9KgFqitk5FLJ9DqYN
         2lzun4/M0H1MSBedYYflc06weUGcZtoEvJgY02u1ig7tbZl4/Od8I3HgCbeHOk4Y4rDX
         9SZAQmWaEABWyJv71rIu6g0J3BSbeeljRIe+SeIUxucgPmXpSinMQmPE3dQHPi9Ofq5h
         gNTg==
X-Forwarded-Encrypted: i=1; AL+hErF7zirCMlOlG644kzsseu60BgEQrV0nRo1NXVUioTW3R59fZW33WyKtgh2HNnzCwouW5swBOp1XkS1I+fs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PxHXxC6asGlTaeRP9p7iwVmFtvNvOKqKh0i6dLi2tdf8Yv5tI
	I+EASBf1aDyCcZFAcMbBQ5BV2vlNxyBwXY1gYBxhk9fzwZi4uq37YTPgqSapN4h2SpSxsvn0W1B
	S/plmVzlfL0mRKHUwcw==
X-Received: from wrob15.prod.google.com ([2002:adf:ee8f:0:b0:48e:d59:85ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2312:b0:485:8cc8:1f5f with SMTP id ffacd0b85a97d-4a63c6590f3mr13110796f8f.42.1795097580124;
 Thu, 19 Nov 2026 06:13:00 -0800 (PST)
Date: Thu, 19 Nov 2026 14:12:44 +0000
In-Reply-To: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=8dTFAUonXyEkYL/wNlIdqEDt0bd9IpV31R8kzKFHvmk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/wPjARfxvVTAMK4l8BhuFbpAzEG8l6+qpcHqZ
 cfRD3c7ALCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav8D4wAKCRAEWL7uWMY5
 RpnED/91VIGr3SMg9ThB0WCISSggasOnHr8OML7VCrcXnwq0UKb2vwaI0zt4AGoHrZRhI3qjJo+
 MYEKV3UyEeQopABjBbi7R/Bmx6tFec4YIIJepzh/VCWTR7zvWdUHh/ec0pbgExBrNj+6fgPW0TR
 0qM6K0+w7C5/9qKjWWh5zSnoVf/yUxV6Nbq/NEKKjxivJ+pDLGr953TIzBZkeF41mEyshYXZmBb
 rYwGC03xarVxkBoTIPBplpqFZDrl22+9Y4FIgpzKeIARQNmjshJCfqqVYiiM7xdQ1HgFo27kj7u
 mOnvEUSL3X6oDGlHqEG6l6LWxygpDTXV84dDT3fY7UD1juMCpE2q1qGR+r0YuEWk3bvMkc7rA4i
 hG//99d6NFQBlKDU7y3KDYN+TUJhyeZNBSNWWZ3y2Y9l3wZam9BCpa+pcACbfcJpD0H405EJVpt
 Gf0n+mMcQJ1h5ILlyeblNqwbxq0KONGHVYSNmpiTzbwPmEHItO44DsZSrM7usHt3P7T0BnQsV9H
 4HXVZSPtbslryRbc3eVng3aYXjlE4PBXvVIZgPLODN6bLk/4CB1o26D2cObOLHW1wRS1LUxgc4s
 NJRST19b+9LQbztdmFaWMTIcQPSKufNVip+j1Ye9ykscRymsX/CUGmRsoxYySpBuftIuesTfMpg A3P8zazraOC+gXQ==
X-Mailer: b4 0.14.3
Message-ID: <20261119-rust-workqueue-v4-3-707c68994940@google.com>
Subject: [PATCH v4 3/5] rust: workqueue: create workqueue subdirectory
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The following patch will implement a workqueue builder in a separate
file. To prepare for that, create a rust/kernel/workqueue subdirectory
and move the existing file.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Philipp Stanner <phasta@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 MAINTAINERS                                    | 1 +
 rust/kernel/{workqueue.rs => workqueue/mod.rs} | 0
 2 files changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9..9d5e2278f1f6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30299,6 +30299,7 @@ F:	Documentation/core-api/workqueue.rst
 F:	include/linux/workqueue.h
 F:	kernel/workqueue.c
 F:	kernel/workqueue_internal.h
+F:	rust/kernel/workqueue/
 
 WWAN DRIVERS
 M:	Loic Poulain <loic.poulain@oss.qualcomm.com>
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue/mod.rs
similarity index 100%
rename from rust/kernel/workqueue.rs
rename to rust/kernel/workqueue/mod.rs

-- 
2.56.1.708.g77570a6a1d-goog

