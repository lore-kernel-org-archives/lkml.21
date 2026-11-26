Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702142;
	b=Gpnj6rqCw5LZshateTHOWEzCIM+rprihvplYqQsUmA+qRa7r693nLa4dqtkwN1rZimbn
	 YHLJ0nXdRsgM/GsIR6yu00MkJgu8vUGaQ+0W46SfGMePJKNioKK6WdnBSCFHM3C2eflqe
	 08eZ1uatV/Gmdc5ktQJP+bHWnlEcsfECBkXUB+nF0P9jXOvzcLwiOWha/ACc3Xw/EZ2/7
	 yy319E/59B+Djr//VYRCu1D4v+h7UOC5HqYS/qVoSMfPJHhhXYwgK+hpR8LbpqaeWSeKZ
	 n6Tuxjagzv2nFTuUjAo9lU4fumv5haRQ8xRb05zT6JB3E4nZfMhkb+Pxlfn/7XR4EGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=GA3jjErzEYnxoF7n+/ic3y3L8vij59KVAFVMuR5dBb0=;
	b=rg6TbAVCdzEBDks2p+TG7S650xAeRzsqgTffGdBRa6MdOMeHXQs8TngMMkyuTNbh1EiZ
	 blaspC9uIU1KqEsAembscHo1kDtXcP2mMHiINKrbro7bpVlzl1P42C8cKN5vsuQGSLVsU
	 A13UljCoxDEHPfSNr4Nm99+v7hZoZvMG0eXwdBLzki0dX6AKB1YWh1xwN0psdt6Sm/m5Z
	 Uw0h8MkLXowPr6IrdIbPiyRP4IF5yA0LUzlWow1me47c5Ok4vVpkt5oDHdxVWmLN0cx44
	 RNYOhW9HVIiJQoL26bBoQ2BKVHBEZEEjObgVxqQPB3S+IkJjO5iVAV8Y9XpTHMlURag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TxII5QHD;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82F5606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 14:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C82F5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TxII5QHD
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc758830601so5255793a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795702141; x=1796306941; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GA3jjErzEYnxoF7n+/ic3y3L8vij59KVAFVMuR5dBb0=;
        b=TxII5QHDK0stzogCWbY6gZRZufXl35OTuDpxw8Ei5/BTICnIyJeVN2pNrofOI0JQ/d
         eXojWIsRKkk+MIoB/gnbwAXUKmFwjLdAZH2IslSvzLOorzJwc3nx2BkxBL9RJgg24SkU
         6pk7zNog4reBcKWBEIhJO2VZmd4kcRb/K+X53r2VDfdtsapON3zyscxse62lpH7G5aLl
         wfcGZg0wbhIXLZ83UA2RRwaZ5cOhbPA4tYQ7/1r9cC7mV5lC6EqAXcqzLgFCHn1RQZ26
         POFN3Y84efXf95FDl8F48Ptlw28oy7XwowN/qgsG5fvGkU4dHco/ScRs6z9ZpQMfTmqP
         BEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702141; x=1796306941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GA3jjErzEYnxoF7n+/ic3y3L8vij59KVAFVMuR5dBb0=;
        b=v3wKlTLz0aBmkvqDgJcjp+uxireaq11+87Ymf7ZYs0q3Djf7rkJDZxnlYxLGdOl72z
         GnCFTJqLwpBzC6YRomfgKnw4ILPTMzf6UHpZmyPQfGXUC9G3EYxBRtJ2JRDnxq2BNBEc
         yzpschkF0CbOqM61RpTS3U2/YDnKk8oA+TvuSjt5FBhX+RVxLUN5gIAfOh6PrgLIezVK
         XLN25BpC4txRL2N1njrs68d/VO3yUJZIpV1cmW2DLt7N4fy3WPXreqgl3LeMc6bWNOvv
         +FB+jZ3pUu35FccHN6071pErEtC42nIO9/c5OEw1nLsbLFSXqk17NTLkbDS4g27wLg6D
         BByA==
X-Forwarded-Encrypted: i=1; AL+hErH39k0MdbccetzNZSQg1NUQLhw3l7B76sZ6HvgfuBDauGYd1AVgIxIV8R4Q1MY1Xv6vFPeaz+jNXUL3RGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fZshrO//dyENgviVOLBTt+uo3YninVQPXvUzUIj/51hUn2jY7
	eUc1Lvddl3ddQVduFRgNwPJPBwg96I/xvliNMsP51CLuSFFubo3X64xm
X-Gm-Gg: AZFdTZcfweSQgC12v0b9OeGEWJU0HGihM5vW1IJ+Iyxvxwn05CTG5WDwZ4lWqaaA1oZ
	7vkquNfenACP9jqVk1npETnCXZOq8m/DLL/CbdeW7OKq8F6ipx5tlYO9w4NJMNE/cAkKJyk/+y0
	FIQGgFMuRSbG7aWBTb5J2TkgBMOlf81g82oTitirCbmZ+VNJEuQElba+2vwndBSADSmFJrVTjss
	bjLQ/buBzlbGyOetvs+yQhwJ7I3cCsQdYvrxADc/1iZQLiOCRzMfQGlUkDRCnnILY00Gswsd2Bn
	OqkfDYIiEzLycURWDjh6l8ERp5mNwxAMr2y4gDyilzjQR6qhfIjI/kvyxRIjInPMJ+h+g/P3tiF
	EmeqgqWiTDr/ic+YewDTjgMvK7MY/iuQHqMPhQ2j0wkZ6eRJCci10k7QG4u9T3f5Y8Vb9Zh3aId
	cym6X97GvnHPahO2ajHsmrwjks+HMyPBA0vWA8zQwg63vrXBZCGy134PIL03DccIP06ZcJaNUTB
	tw4+1Rg+Nr/0Xg9+dXSYCLyqT/D2VzuTxYtYbyyDnLJBOUM8Fbp8QKZ6LcUA1jo7iTFiaU9xB/t
	zNdwiV/sage+QeYHrLoAUPlUb6SCV4t/20QD3xBOpcknTL+nUYjxmVzxqu+7N4hInqmoSxRDKvG
	T1bZqekyUg8V4qIRY8bC4PdKG7W16k7ag6DcJVeDFxxkHn8ZZpKk1GtUN
X-Received: by 2002:a17:90b:4a92:b0:3b3:fd13:683a with SMTP id 98e67ed59e1d1-3b41c995b82mr20643205a91.59.1795702140978;
        Thu, 26 Nov 2026 06:09:00 -0800 (PST)
Received: from [169.254.3.1] ([143.248.188.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm12583573a91.3.2026.11.26.06.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:09:00 -0800 (PST)
From: SeungJong Ha <engineer.jjhama@gmail.com>
Date: Thu, 26 Nov 2026 23:08:33 +0900
Subject: [PATCH net-next v4 2/2] rust: net: phy: pass &Device to suspend,
 read_mmd and write_mmd
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-exp-phy-rs-maybelocked-v4-2-16f9a10bb579@gmail.com>
References: <20261126-exp-phy-rs-maybelocked-v4-0-16f9a10bb579@gmail.com>
In-Reply-To: <20261126-exp-phy-rs-maybelocked-v4-0-16f9a10bb579@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Trevor Gross <tmgross@umich.edu>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.15.2

phy_suspend() calls `suspend` without `phy_device->lock`, also right
after the state machine drops it, and __phy_read_mmd() and
__phy_write_mmd() call `read_mmd` and `write_mmd` with the MDIO bus lock
held but not necessarily `phy_device->lock`. Yet these callbacks get a
`&mut Device` and can call methods such as set_speed() that rely on the
lock.

Pass a `&Device` instead, and document that read() and write() deadlock
in `read_mmd` and `write_mmd`. Update ax88796b_rust, the only user of
`suspend`; it only calls genphy_suspend().

Suggested-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
 drivers/net/phy/ax88796b_rust.rs |  4 ++--
 rust/kernel/net/phy.rs           | 36 +++++++++++++++++++++---------------
 2 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index 2d24628a4e58..890ae79d8561 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -77,7 +77,7 @@ fn read_status(dev: &mut phy::Device) -> Result<u16> {
         Ok(0)
     }
 
-    fn suspend(dev: &mut phy::Device) -> Result {
+    fn suspend(dev: &phy::Device) -> Result {
         dev.genphy_suspend()
     }
 
@@ -107,7 +107,7 @@ impl Driver for PhyAX88772C {
     const NAME: &'static CStr = c"Asix Electronics AX88772C";
     const PHY_DEVICE_ID: DeviceId = DeviceId::new_with_exact_mask(0x003b1881);
 
-    fn suspend(dev: &mut phy::Device) -> Result {
+    fn suspend(dev: &phy::Device) -> Result {
         dev.genphy_suspend()
     }
 
diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index bb2cc6b3c94c..d04a651ae62b 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -371,10 +371,10 @@ impl<T: Driver> Adapter<T> {
     /// `phydev` must be passed by the corresponding callback in `phy_driver`.
     unsafe extern "C" fn suspend_callback(phydev: *mut bindings::phy_device) -> c_int {
         from_result(|| {
-            // SAFETY: The C core code ensures that the accessors on
-            // `Device` are okay to call even though `phy_device->lock`
-            // might not be held.
-            let dev = unsafe { Device::from_raw_mut(phydev) };
+            // SAFETY: `phydev` is valid for the duration of the callback. `phy_suspend()` does not
+            // take `phy_device->lock`, and `phy_state_machine()` calls it right after dropping the
+            // lock, so this gets a `&Device`.
+            let dev = unsafe { Device::from_raw(phydev) };
             T::suspend(dev)?;
             Ok(0)
         })
@@ -439,10 +439,10 @@ impl<T: Driver> Adapter<T> {
         regnum: u16,
     ) -> i32 {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw_mut(phydev) };
+            // SAFETY: `phydev` is valid for the duration of the callback. PHYLIB calls this with
+            // the MDIO bus lock held but not necessarily `phy_device->lock`, so this gets a
+            // `&Device`.
+            let dev = unsafe { Device::from_raw(phydev) };
             // CAST: the C side verifies devnum < 32.
             let ret = T::read_mmd(dev, devnum as u8, regnum)?;
             Ok(ret.into())
@@ -459,10 +459,10 @@ impl<T: Driver> Adapter<T> {
         val: u16,
     ) -> i32 {
         from_result(|| {
-            // SAFETY: This callback is called only in contexts
-            // where we hold `phy_device->lock`, so the accessors on
-            // `Device` are okay to call.
-            let dev = unsafe { Device::from_raw_mut(phydev) };
+            // SAFETY: `phydev` is valid for the duration of the callback. PHYLIB calls this with
+            // the MDIO bus lock held but not necessarily `phy_device->lock`, so this gets a
+            // `&Device`.
+            let dev = unsafe { Device::from_raw(phydev) };
             T::write_mmd(dev, devnum as u8, regnum, val)?;
             Ok(0)
         })
@@ -617,7 +617,7 @@ fn read_status(_dev: &mut Device) -> Result<u16> {
     }
 
     /// Suspends the hardware, saving state if needed.
-    fn suspend(_dev: &mut Device) -> Result {
+    fn suspend(_dev: &Device) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
@@ -627,12 +627,18 @@ fn resume(_dev: &mut Device) -> Result {
     }
 
     /// Overrides the default MMD read function for reading a MMD register.
-    fn read_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16) -> Result<u16> {
+    ///
+    /// PHYLIB calls this with the MDIO bus lock held, so calling [`Device::read`] or
+    /// [`Device::write`] here deadlocks.
+    fn read_mmd(_dev: &Device, _devnum: u8, _regnum: u16) -> Result<u16> {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 
     /// Overrides the default MMD write function for writing a MMD register.
-    fn write_mmd(_dev: &mut Device, _devnum: u8, _regnum: u16, _val: u16) -> Result {
+    ///
+    /// PHYLIB calls this with the MDIO bus lock held, so calling [`Device::read`] or
+    /// [`Device::write`] here deadlocks.
+    fn write_mmd(_dev: &Device, _devnum: u8, _regnum: u16, _val: u16) -> Result {
         build_error!(VTABLE_DEFAULT_ERROR)
     }
 

-- 
2.54.0

