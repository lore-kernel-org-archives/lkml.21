Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795270714;
	b=gR1VqiAmlHXr3rt/0KlRBxsiXkOgZRRM4H4TFdnWTYmirRQM8lUwYH98nEOwJ1OH+xip
	 CGHW+MOXCSNZ+xTxThLRcLyzI6Cgd4EOapgtdfqUgyrW30+/xnz+M9hLvYUW2ODf2kAWY
	 oSb1vppeKkBpcVjhujXP17qJw42PrgsCLAMQ2017fi3+kiy5+ixYZwpsNY5LvoDX1pPEL
	 RHtTlN5EVrg5YZd4yFud0ljlbXW1015UbWgXq1q0kpUOSVYb3m6GR1TLA+5MCgYJ9A2rh
	 b7WFHWuoELKLjGN8G69PQ4EeLXrJem9YkTfW9IlbeBo6JLrrEICgPoxfSW3Qi1rJO+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795270714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dCAFzOhTnSyNCAJ1uIRHjqbjpv162MEYCH3m4VjXm3w=;
	b=IGvwa4ed1dwlpihrA4b2d/MgOZtURl4ndxpNolHDafHVuGBK/KEAUKJE2nvzmmSoBAcL
	 w/cIT4xSaiZ/JD8gwm6z3i7egsBqatMM7Jy8gRi0thr4pQZNRJmbCBk3R+6OdHVhhpXOd
	 I+3dIAJq6xx5eE+Z0TJyrR11KW7BTg+Rrnk0HLZPTIwbwnmkeHk1rOSAhSLM8+nfMrOMR
	 0W/Vi0Bl0T7not/hOA+xD73Dfdf85A4GQaxeSRDP3Stcdvfw9lzOsLiFRgeDBObpRvDr7
	 khtQge4cvKCrgknLmue/8Dz+cSwut0VOMOk6c7Onk6VWS9iN0O6ywj3rA0toWVcrgBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="PU7Wr/Vj";
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CCF606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 14:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CCF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PU7Wr/Vj
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a799d93bc3so893126f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 06:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795270711; x=1795875511; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCAFzOhTnSyNCAJ1uIRHjqbjpv162MEYCH3m4VjXm3w=;
        b=PU7Wr/VjXOZecs4TSlh2pNhRBq/qz3ZifMr3yFet1f0eSnxX9tQZMI4wara3oxJ+/v
         z3DTTFrack2frSozA7QyY7+evdjLwdycf4vRsiDxPTWWaeRlOftt5hP5YuAltLkBFnit
         TayPpYyyCBIyIHmuNFSUHP7IvTPltLYF6awd59rnaCOpvy6Jc2qdSuxVKQDEnl2wqjUZ
         /9MKXNM6r2EgXxKvqN4ykxyQHt8OZwXn79SPgq3YNvLCdjGTwVpRXbmh6776AhZtIxgG
         U54Au0xauQ6s8kxyQgvYFn3Inm5UlB7fznAohZvC8PBjx/LzwazqT34fBBHrDzc4xXwK
         t9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795270711; x=1795875511;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCAFzOhTnSyNCAJ1uIRHjqbjpv162MEYCH3m4VjXm3w=;
        b=ly9yaJ0iZ+Nw9lMABeRohRE9j/zer4et9542+P/MMSbOnhWMsADFEhtIvoOOWDCBgQ
         jkd6+R2Lw1UcjYyrGSRUQjMAmDOe++SYr4Gc0rgGoeBB7JTxi33L6TUo2bNrywFp7znT
         maHyzQfUc2RSm0uQiqMMtoJ3ikfnhRkvttkJpt9g1cjYmcSP2tLMtT1Q1avpaHglCyZt
         RK53OVsRz6Ave8+VsXft2itwoVGhMvmC+EQIwGCwRJqZQJxQNbEzJ6gURG1QxdA08FTn
         l86ep4ewy9v9Xzk3OMGIDw+Vz7dU/LSs0t33lNfyw3UF9Lf1Z59Ma4VeM18rlHafvq89
         9blQ==
X-Forwarded-Encrypted: i=1; AL+hErFYI9Q3Ant73h4ZXh1vvdT/Uurm0aYEkIy8g5umpx3TvWQKcmTPGnQwrm54kpOZ07dFD1DSTAMKbk8hW6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3fAKF2TUSBnrN7VyttTgqDExALKCzA1zIxHTFF1h00e7KKuvH
	5ckh93+uKYeBCO0ltcsncxr1rKlCTgM7F/7fnR8569HQnESD792w5C4JdafZ+p23u4yfiZKQC4X
	tKtbAvNaNkQCPs58b1Q==
X-Received: from wrnb18.prod.google.com ([2002:adf:e652:0:b0:48e:d59:85ff])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4312:b0:4a7:2673:ad2e with SMTP id ffacd0b85a97d-4abacfea57emr13722499f8f.1.1795270711197;
 Sat, 21 Nov 2026 06:18:31 -0800 (PST)
Date: Sat, 21 Nov 2026 14:18:30 +0000
In-Reply-To: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-b4-dev_query_fixes-v4-0-df66b4c98bc6@collabora.com>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261121141830.171033-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 0/3] drm/tyr: allow mismatched buffers for dev_query
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Deborah Brouwer <deborah.brouwer@collabora.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Miguel, are you ok with me taking these uaccess changes through drm-rust-next?

Alice
